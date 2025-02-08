//
//  Game.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/8/25.
//

import SwiftData
import SwiftUI

@Model
class Game {
    var id: UUID
    var date: Date
    var teams: [Team]
    var rounds: [Round]
    var winningTeam: Team?
    var finalScores: [TeamScore]
    var isComplete: Bool
    
    init(id: UUID = UUID(), date: Date = Date(), teams: [Team], rounds: [Round] = []) {
        self.id = id
        self.date = date
        self.teams = teams
        self.rounds = rounds
        self.finalScores = []
        self.isComplete = false
    }
}
