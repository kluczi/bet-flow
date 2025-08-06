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
            VStack {
                if vm.isLoading {
                    ProgressView("Loading...")
                } else if let err = vm.errorMessage {
                    Text("err: \(err)")
                        .foregroundColor(.red)
                } else {
                    List(vm.events) { event in
                        ForEach(event.bookmakers) { bookmaker in
                            if let market = bookmaker.markets.first,
                               market.outcomes.count == 2 {
                                let outcome1 = market.outcomes[0]
                                let outcome2 = market.outcomes[1]
                                
                                SingleMatchCard(
                                    event: event.sportTitle,
                                    player1: outcome1.name,
                                    player2: outcome2.name,
                                    odds1: outcome1.price,
                                    odds2: outcome2.price
                                )
                                .padding(.horizontal,12)
                                .padding(.bottom, 16)
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                                .background(.clear)
                                .listRowBackground(Color.clear)
                            }
                        }
                        
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(Color.primaryBgColor)
                    
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
