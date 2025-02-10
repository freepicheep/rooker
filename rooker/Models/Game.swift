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
        self.finalScores = [
            TeamScore(teamId: teams[0].id, score: 0),
            TeamScore(teamId: teams[1].id, score: 0)
        ]
        self.isComplete = false
    }
    
    // Add this computed property
    var currentScore: [TeamScore] {
        var scores: [String: Int] = [:]
        
        // Initialize scores for each team
        for team in teams {
            scores[team.id.uuidString] = 0
        }
        
        // Sum up all round scores
        for round in rounds {
            for score in round.scores {
                scores[score.teamId.uuidString, default: 0] += score.score
            }
        }
        
        // Convert to TeamScore array
        return teams.map { team in
            TeamScore(teamId: team.id, score: scores[team.id.uuidString] ?? 0)
        }
    }
    
    // Add this method
    func addRound(bidAmount: Int, tookKitty: Player) {
        let roundNumber = rounds.count + 1
        let newRound = Round(
            game: self,
            bidAmount: bidAmount,
            tookKitty: tookKitty,
            roundNumber: roundNumber
        )
        rounds.append(newRound)
        
        // Update final scores
        finalScores = currentScore
    }
    
    // Helper method to update game status
    func updateGameStatus() {
        if rounds.count >= 13 { // Assuming a game has 13 rounds
            isComplete = true
            winningTeam = currentScore[0].score > currentScore[1].score ? teams[0] : teams[1]
        }
    }
}
