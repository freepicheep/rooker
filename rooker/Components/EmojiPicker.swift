//
//  EmojiPicker.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/10/25.
//

import SwiftUI

struct EmojiPicker: View {
    @Binding var selection: String
    @State private var showingPicker = false
    
    // Common emojis for games/sports
    private let emojis = ["😀", "😎", "🎮", "🎲", "🎯", "🎪", "🎨", "🎭", "🎪", "🦁", "🐯", "🐶", "🦊", "🦝", "🦄", "🦈", "🐙", "🦋", "⭐️", "🌟", "💫", "🔥", "⚡️", "❄️", "🌈"]
    
    var body: some View {
        Button {
            showingPicker = true
        } label: {
            Text(selection)
                .font(.title2)
                .padding(8)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.2))
                }
        }
        .popover(isPresented: $showingPicker) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 10) {
                ForEach(emojis, id: \.self) { emoji in
                    Button {
                        selection = emoji
                        showingPicker = false
                    } label: {
                        Text(emoji)
                            .font(.title)
                    }
                }
            }
            .padding()
        }
    }
}
