//
//  BetsViewModel.swift
//  BetFlow
//
//  Created by Bartek on 13/05/2025.
//

import Foundation

@MainActor
final class BetsViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadOdds() async {
        isLoading = true
        errorMessage = nil

        let now = Date()
        let from = Calendar.current.date(byAdding: .day, value: -1, to: now)!
        let to   = Calendar.current.date(byAdding: .day, value: 1, to: now)!

        do {
            let fetched = try await APIService.shared.fetchOdds(commenceFrom: from,
                                                                commenceTo: to)
            self.events = fetched
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
