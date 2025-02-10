//
//  PlayerSetupRow.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/10/25.
//

import SwiftUI
import SwiftData

struct PlayerSetupRow: View {
    @Binding var player: PlayerSetup
    @Query private var existingPlayers: [Player]
    
    var body: some View {
        HStack {
            PlayerNameTextField(text: $player.name)
            EmojiPicker(selection: $player.emoji)
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.1))
        }
    }
}
