//
//  ContentView.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        HomeScreen()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Game.self, inMemory: true)
}
