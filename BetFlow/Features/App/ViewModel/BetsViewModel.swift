//
//  BetsViewModel.swift
//  BetFlow
//
//  Created by Bartek on 10/06/2025.
//

import Combine
import Foundation

final class BetsViewModel: ObservableObject {
    @Published var sport: String = ""
    @Published var event: String = ""
    @Published var outcome: String = ""
    @Published var oddsText: String = ""
    @Published var stakeText: String = ""
}
