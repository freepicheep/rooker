//
//  NewGameSheet.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/10/25.
//

import SwiftUI
import SwiftData

struct NewGameSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Binding var navigationPath: NavigationPath
    @State private var team1 = TeamSetup()
    @State private var team2 = TeamSetup()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TeamSetupCard(setup: $team1, title: "Team 1")
                TeamSetupCard(setup: $team2, title: "Team 2")
            }
            .padding()
            .navigationTitle("New Game")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Start Game") {
                        createGame()
                    }
                    .disabled(!isFormValid)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private var isFormValid: Bool {
        !team1.name.isEmpty &&
        !team1.player1.name.isEmpty &&
        !team1.player2.name.isEmpty &&
        !team2.name.isEmpty &&
        !team2.player1.name.isEmpty &&
        !team2.player2.name.isEmpty
    }
    
    private func createGame() {
        // Create players
        let player1Team1 = Player(name: team1.player1.name, emoji: team1.player1.emoji)
        let player2Team1 = Player(name: team1.player2.name, emoji: team1.player2.emoji)
        let player1Team2 = Player(name: team2.player1.name, emoji: team2.player1.emoji)
        let player2Team2 = Player(name: team2.player2.name, emoji: team2.player2.emoji)
        
        // Create teams
        let team1Instance = Team(
            teamName: team1.name,
            emoji: team1.emoji,
            players: [player1Team1, player2Team1]
        )
        
        let team2Instance = Team(
            teamName: team2.name,
            emoji: team2.emoji,
            players: [player1Team2, player2Team2]
        )
        
        // Create game
        let game = Game(teams: [team1Instance, team2Instance])
        
        // Save everything
        modelContext.insert(game)
        
        // Dismiss the sheet
        navigationPath.append(game)
        dismiss()
    }
}

struct TeamSetup {
    var name: String = ""
    var emoji: String = "😀"
    var player1 = PlayerSetup()
    var player2 = PlayerSetup()
}

struct PlayerSetup {
    var name: String = ""
    var emoji: String = "😀"
}

struct TeamSetupCard: View {
    @Binding var setup: TeamSetup
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                TextField("Team Name", text: $setup.name)
                EmojiPicker(selection: $setup.emoji)
            }
            
            PlayerSetupRow(player: $setup.player1)
            PlayerSetupRow(player: $setup.player2)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.background)
                .shadow(radius: 3)
        }
    }
}
