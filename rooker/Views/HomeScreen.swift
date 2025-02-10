//
//  HomeScreen.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/10/25.
//

import SwiftData
import SwiftUI

struct HomeScreen: View {
    @Query(sort: \Game.date, order: .reverse) private var recentGames: [Game]
    @State private var showingNewGame = false
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(recentGames) { game in
                        GameCard(game: game)
                    }
                }
                .padding()
            }
            .navigationTitle("Recent Games")
            .toolbar {
                Button(action: { showingNewGame = true }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                }
            }
        }
        .sheet(isPresented: $showingNewGame) {
            NewGameSheet(navigationPath: $navigationPath)
        }
    }
}

struct GameCard: View {
    let game: Game

    var body: some View {
        VStack {
            HStack {
                TeamScoreView(team: game.teams[0], score: game.finalScores[0].score)
                Spacer()
                TeamScoreView(team: game.teams[1], score: game.finalScores[1].score)
            }
            // Add more game details as needed
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.background)
                .shadow(radius: 5)
        }
    }
}
