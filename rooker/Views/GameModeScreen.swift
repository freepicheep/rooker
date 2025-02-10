//
//  GameModeScreen.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/10/25.
//

import SwiftUI
import SwiftData

// MARK: - Game Mode Screen
struct GameModeScreen: View {
    let game: Game
    
    var body: some View {
        VStack {
            // Score Header
            ScoreHeader(game: game)
            
            // Rounds List
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(game.rounds) { round in
                        RoundCard(round: round)
                    }
                }
                .padding()
            }
        }
        .toolbar {
            Button("New Round") {
                // Show new round sheet
            }
        }
    }
}

struct ScoreHeader: View {
    let game: Game
    
    var body: some View {
        HStack {
            TeamScoreView(team: game.teams[0], 
                         score: game.currentScore[0].score)
            Spacer()
            VStack {
                Text("VS")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            TeamScoreView(team: game.teams[1], 
                         score: game.currentScore[1].score)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.background)
                .shadow(radius: 3)
        }
    }
}

struct RoundCard: View {
    let round: Round
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Bid: \(round.bidAmount)")
                Text("Winner: \(round.winningTeam?.teamName ?? "")")
            }
            
            Spacer()
            
            // Score difference indicator
            Image(systemName: "arrow.up")
                .foregroundColor(.green)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                ForEach(round.scores, id: \.teamId) { score in
                    Text("\(score.score)")
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.background)
                .shadow(radius: 3)
        }
    }
}
