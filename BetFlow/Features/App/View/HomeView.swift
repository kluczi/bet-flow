//
//  HomeView.swift
//  BetFlow
//
//  Created by Bartek on 11/05/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            MatchesView()
                .tabItem {
                    Label("Zakłady", systemImage: "tennisball.fill")
                }
            StatsView()
                .tabItem {
                    Label("Statystyki", systemImage: "chart.bar")
                }
            
            BetsView()
                .tabItem{
                    Label("Zakłady", systemImage: "note")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person")
                }
        }
    }
}

#Preview {
    HomeView()
}
