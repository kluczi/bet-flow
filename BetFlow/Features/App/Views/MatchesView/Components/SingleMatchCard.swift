//
//  SingleMatchCard.swift
//  BetFlow
//
//  Created by Bartek on 06/08/2025.
//

import SwiftUI

struct SingleMatchCard:View {
    let event: String
    let player1: String
    let player2: String
    let odds1: Double
    let odds2: Double
    var body: some View {
        VStack(alignment: .leading) {
            HStack (alignment: .center, spacing: 6) {
                Image(event.contains("ATP") ? "AtpIcon" : "WtaIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 48)
                    .clipShape(Circle())
                Text(event)
                    .foregroundStyle(Color.primaryFontColor)
            }
            .padding(8)
            HStack {
                Spacer()
                VStack (spacing: 6) {
                    Text(player1)
                        .foregroundStyle(Color.primaryFontColor)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                    Text(String(format: "%.2f", odds1))
                        .foregroundStyle(Color.secondaryFontColor)
                        .font(.system(size: 16))
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(Color.primaryBgColor)
                )
                Spacer()
                Text("vs")
                    .foregroundStyle(Color.primaryFontColor)
                    .font(.system(size: 16))
                    .background(
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(Color.primaryBgColor)
                    )
                Spacer()
                VStack (spacing: 6) {
                    Text(player2)
                        .foregroundStyle(Color.primaryFontColor)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                    Text(String(format: "%.2f", odds2))
                        .foregroundStyle(Color.secondaryFontColor)
                        .font(.system(size: 16))
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(Color.primaryBgColor)
                )
    
                Spacer()
                
            }
            .padding(8)
        }
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color.secondaryColor)
        )
    }
}

#Preview {
    ZStack {
        Color.primaryBgColor.ignoresSafeArea()
        SingleMatchCard(event: "ATP Washington", player1: "Ben Shelton",player2: "Jannik Sinner", odds1: 2.02, odds2: 1.46)
    }
}
