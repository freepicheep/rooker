//
//  Round.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/8/25.
//

import SwiftData
import SwiftUI

@Model
class Round {
    var id: UUID
    var game: Game? // Relationship to parent game
    var bidder: Player
    var bidAmount: Int
    var tookKitty: Player
    var winningTeam: Team?
    var scores: [TeamScore]
    var roundNumber: Int
    
    init(id: UUID = UUID(), game: Game? = nil, bidder: Player, bidAmount: Int, tookKitty: Player, roundNumber: Int) {
        self.id = id
        self.game = game
        self.bidder = bidder
        self.bidAmount = bidAmount
        self.tookKitty = tookKitty
        self.scores = []
        self.roundNumber = roundNumber
    }
}

struct TeamScore {
    let teamId: UUID
    let score: Int
}
