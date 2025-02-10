//
//  NewRoundSheet.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/10/25.
//

import SwiftUI
import SwiftData

struct NewRoundSheet: View {
    @Environment(\.dismiss) private var dismiss
    let game: Game
    @State private var selectedBidder: Player?
    @State private var bidAmount: Int = 0
    @State private var selectedKittyTaker: Player?
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Bidder") {
                    ForEach(game.teams) { team in
                        ForEach(team.players) { player in
                            Button {
                                selectedBidder = player
                            } label: {
                                HStack {
                                    Text(player.emoji)
                                    Text(player.name)
                                    Spacer()
                                    if selectedBidder == player {
                                        Image(systemName: "checkmark")
                                            .foregroundStyle(.blue)
                                    }
                                }
                            }
                            .foregroundStyle(.primary)
                        }
                    }
                }
                
                Section("Bid Amount") {
                    Stepper("Bid: \(bidAmount)", value: $bidAmount, in: 0...800, step: 5)
                }
                
                Section("Took Kitty") {
                    ForEach(game.teams) { team in
                        ForEach(team.players) { player in
                            Button {
                                selectedKittyTaker = player
                            } label: {
                                HStack {
                                    Text(player.emoji)
                                    Text(player.name)
                                    Spacer()
                                    if selectedKittyTaker == player {
                                        Image(systemName: "checkmark")
                                            .foregroundStyle(.blue)
                                    }
                                }
                            }
                            .foregroundStyle(.primary)
                        }
                    }
                }
            }
            .navigationTitle("New Round")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        addRound()
                    }
                    .disabled(selectedBidder == nil || selectedKittyTaker == nil || bidAmount == 0)
                }
            }
        }
    }
    
    private func addRound() {
        guard let bidder = selectedBidder,
              let kittyTaker = selectedKittyTaker else { return }
        
        game.addRound(bidAmount: bidAmount, tookKitty: kittyTaker)
        dismiss()
    }
}
