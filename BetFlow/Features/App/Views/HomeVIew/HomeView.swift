//
//  HomeView.swift
//  BetFlow
//
//  Created by Bartek on 11/05/2025.
//

import SwiftUI

struct HomeView: View {
    var onLogout: () -> Void
    var body: some View {
//        Button("Logout") {
//            onLogout()
//        }
//        .padding()
//        .buttonStyle(.bordered)
        TabView {
            MatchesView()
                .tabItem {
                    Label("Upcoming", systemImage: "tennisball.fill")
                }
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
            
            BetsView()
                .tabItem{
                    Label("Bets", systemImage: "note")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
//            LoginView()
//                .tabItem {
//                    Label("Login", systemImage: "person")
//                }
        }
    }
}

//#Preview {
//    HomeView()
//}
