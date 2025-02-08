//
//  Team.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/8/25.
//

import SwiftData
import SwiftUI

@Model
class Team {
    var id: UUID
    var teamName: String
    var emoji: String
    var players: [Player]
    var games: [Game]? // Reverse relationship
    
    init(id: UUID = UUID(), teamName: String, emoji: String, players: [Player] = []) {
        self.id = id
        self.teamName = teamName
        self.emoji = emoji
        self.players = players
    }
}
