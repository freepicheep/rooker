//
//  PlayerNameTextField.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/10/25.
//

import SwiftUI
import SwiftData

struct PlayerNameTextField: View {
    @Binding var text: String
    @Query private var existingPlayers: [Player]
    @State private var showingSuggestions = false
    
    var filteredPlayers: [Player] {
        guard !text.isEmpty else { return [] }
        return existingPlayers.filter { $0.name.localizedCaseInsensitiveContains(text) }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Player Name", text: $text)
                .textFieldStyle(.roundedBorder)
                .onChange(of: text) { _, _ in
                    showingSuggestions = !text.isEmpty
                }
            
            if showingSuggestions && !filteredPlayers.isEmpty {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(filteredPlayers) { player in
                            Button {
                                text = player.name
                                showingSuggestions = false
                            } label: {
                                HStack {
                                    Text(player.emoji)
                                    Text(player.name)
                                        .foregroundStyle(.primary)
                                }
                                .padding(.vertical, 4)
                            }
                            
                            if player != filteredPlayers.last {
                                Divider()
                            }
                        }
                    }
                }
                .frame(maxHeight: 150)
                .padding(8)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.systemBackground))
                        .shadow(radius: 2)
                }
            }
        }
    }
}
