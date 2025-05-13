//
//  BetsModels.swift
//  BetFlow
//
//  Created by Bartek on 13/05/2025.
//

import Foundation

struct Event: Identifiable, Codable {
    let id: String
    let sportKey: String
    let sportTitle: String
    let commenceTime: Date
    let homeTeam: String
    let awayTeam: String
    let bookmakers: [Bookmaker]

    enum CodingKeys: String, CodingKey {
        case id
        case sportKey = "sport_key"
        case sportTitle = "sport_title"
        case commenceTime = "commence_time"
        case homeTeam = "home_team"
        case awayTeam = "away_team"
        case bookmakers
    }
}

struct Bookmaker: Codable, Identifiable {
    let key: String
    let title: String
    let lastUpdate: Date
    let markets: [Market]

    var id: String { key }

    enum CodingKeys: String, CodingKey {
        case key, title
        case lastUpdate = "last_update"
        case markets
    }
}

struct Market: Codable, Identifiable {
    let key: String
    let lastUpdate: Date
    let outcomes: [Outcome]

    var id: String { key }

    enum CodingKeys: String, CodingKey {
        case key
        case lastUpdate = "last_update"
        case outcomes
    }
}

struct Outcome: Codable, Identifiable {
    let name: String
    let price: Double

    var id: String { name }
}
