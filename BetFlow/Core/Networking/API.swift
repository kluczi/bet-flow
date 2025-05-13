//
//  API.swift
//  BetFlow
//
//  Created by Bartek on 13/05/2025.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case missingAPIKey
    case requestFailed(Error)
    case decodingFailed(Error)
}

final class APIService {
    static let shared = APIService()
    private init() {}

    private var apiKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String,
              !key.isEmpty else {
            fatalError("API KEY not set.")
        }
        return key
    }

    private let baseURL = "https://api.the-odds-api.com/v4/sports/tennis/odds/"

    func fetchOdds(commenceFrom: Date,
                   commenceTo: Date) async throws -> [Event] {

        var comps = URLComponents(string: baseURL)
        let iso = ISO8601DateFormatter()
        iso.formatOptions = [.withInternetDateTime]

        comps?.queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: "regions", value: "eu"),
            URLQueryItem(name: "markets", value: "h2h"),
            URLQueryItem(name: "oddsFormat", value: "decimal"),
            URLQueryItem(name: "commenceTimeFrom", value: iso.string(from: commenceFrom)),
            URLQueryItem(name: "commenceTimeTo",   value: iso.string(from: commenceTo)),
            URLQueryItem(name: "bookmakers", value: "betclic")
        ]

        guard let url = comps?.url else {
            throw APIError.invalidURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode([Event].self, from: data)
        } catch let error as DecodingError {
            throw APIError.decodingFailed(error)
        } catch {
            throw APIError.requestFailed(error)
        }
    }
}
