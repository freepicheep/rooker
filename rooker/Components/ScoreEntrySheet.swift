//
//  ScoreEntrySheet.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/10/25.
//

import SwiftUI
import SwiftData

struct ScoreEntrySheet: View {
    @Environment(\.dismiss) private var dismiss
    let round: Round
    @State private var team1Score: Int = 0
    @State private var team2Score: Int = 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section(round.game?.teams[0].teamName ?? "Team 1") {
                    Stepper("Score: \(team1Score)", value: $team1Score, in: 0...180, step: 5)
                }
                
                Section(round.game?.teams[1].teamName ?? "Team 2") {
                    Stepper("Score: \(team2Score)", value: $team2Score, in: 0...180, step: 5)
                }
            }
            .navigationTitle("Enter Scores")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveScores()
                    }
                }
            }
        }
    }
    
    private func saveScores() {
        guard let game = round.game else { return }
        round.scores = [
            TeamScore(teamId: game.teams[0].id, score: team1Score),
            TeamScore(teamId: game.teams[1].id, score: team2Score)
        ]
        dismiss()
    }
}
