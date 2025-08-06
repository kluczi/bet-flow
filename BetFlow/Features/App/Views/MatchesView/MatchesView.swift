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
        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Loading...")
                } else if let err = vm.errorMessage {
                    Text("err: \(err)")
                        .foregroundColor(.red)
                } else {
                    List(vm.events) { event in
                        Section(header: Text("\(event.sportTitle)").foregroundStyle(Color.mainColor)) {
                            ForEach(event.bookmakers) { bookmaker in
                                VStack(alignment: .leading) {
                                    if(bookmaker.key=="nordicbet") {
                                        Image("BetclicIcon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                    } else {
                                        Text(bookmaker.title)
                                            .font(.headline)
                                    }
                                    ForEach(bookmaker.markets) { market in
                                        ForEach(market.outcomes) { outcome in
                                            HStack {
                                                Text(outcome.name)
                                                Spacer()
                                                Text(String(format: "%.2f", outcome.price))
                                            }
                                        }
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                    
                }
            }
            //            .scrollContentBackground(.hidden)
            //            .background(Color.primaryBgColor)
            .navigationTitle(Text("Nadchodzące mecze"))
            .task {
                await vm.loadOdds()
            }
            
        }
    }
    
}

#Preview {
    MatchesView()
}
