//
//  BetModel.swift
//  BetFlow
//
//  Created by Bartek on 14/05/2025.
//

import Foundation

struct Bet: Identifiable, Codable {
  let id: UUID
  let sport: String
  let event: String
  let outcome: String
  let odds: Double
  let stake: Double

  var profit: Double {
    stake * (odds)
  }
}
