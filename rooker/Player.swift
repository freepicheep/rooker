//
//  Player.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/8/25.
//

import SwiftData
import SwiftUI

@Model
class Player {
    var id: UUID
    var name: String
    var emoji: String
    var team: Team? // Relationship to team
    
    init(id: UUID = UUID(), name: String, emoji: String) {
        self.id = id
        self.name = name
        self.emoji = emoji
    }
}
