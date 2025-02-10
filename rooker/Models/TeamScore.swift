//
//  TeamScore.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/10/25.
//

import SwiftData
import SwiftUI

@Model
class TeamScore {
    var id: UUID
    var teamId: UUID
    var score: Int
    
    init(id: UUID = UUID(), teamId: UUID, score: Int) {
        self.id = id
        self.teamId = teamId
        self.score = score
    }
}
