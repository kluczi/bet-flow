//
//  BetsViewModel.swift
//  BetFlow
//
//  Created by Bartek on 13/05/2025.
//

import Foundation

@MainActor
final class MatchesViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadOdds() async {
        isLoading = true
        errorMessage = nil

        do {
            let fetched = try await APIService.shared.fetchOdds(
                commenceFrom: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                commenceTo:   Calendar.current.date(byAdding: .day, value: 1,  to: Date())!
            )

            let withOdds = fetched.filter { event in
                event.bookmakers.contains { bookmaker in
                    bookmaker.markets.contains { market in
                        !market.outcomes.isEmpty
                    }
                }
            }

            self.events = withOdds

        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}

