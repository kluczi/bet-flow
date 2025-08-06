//
//  BetsView.swift
//  BetFlow
//
//  Created by Bartek on 11/05/2025.
//

import SwiftUI

struct MatchesView: View {
    @StateObject private var vm = MatchesViewModel()
    
    var body: some View {
        ZStack {
            Color.primaryBgColor.ignoresSafeArea()
            VStack (alignment: .leading) {
                if vm.isLoading {
                    ProgressView("Loading...")
                } else if let err = vm.errorMessage {
                    Text("err: \(err)")
                        .foregroundColor(.red)
                } else {
                 
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            Text("Upcoming matches")
                                .foregroundStyle(Color.primaryFontColor)
                                .font(.system(size: 32))
                                .padding(.horizontal,24)
                                .fontWeight(.bold)
                            ForEach(vm.events) { event in
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    
                                    ForEach(event.bookmakers) { bookmaker in
                                        if let market = bookmaker.markets.first,
                                           market.outcomes.count == 2 {
                                            let o1 = market.outcomes[0]
                                            let o2 = market.outcomes[1]
                                            
                                            SingleMatchCard(
                                                event: event.sportTitle,
                                                player1: o1.name,
                                                player2: o2.name,
                                                odds1: o1.price,
                                                odds2: o2.price
                                            )
                                            .padding(.horizontal, 12)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.top, 12)
                    }

                    
                }
            }
            //            .scrollContentBackground(.hidden)
            //            .background(Color.primaryBgColor)
            .task {
                await vm.loadOdds()
            }
        }
        
    }
}


#Preview {
    MatchesView()
}
