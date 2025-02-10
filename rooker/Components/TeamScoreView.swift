//
//  TeamScoreView.swift
//  rooker
//
//  Created by Friedrich Stoltzfus on 2/10/25.
//

import SwiftUI

struct TeamScoreView: View {
    let team: Team
    let score: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            HStack(spacing: 4) {
                Text(team.emoji)
                Text(team.teamName)
                    .font(.headline)
            }
            
            Text("\(score)")
                .font(.title)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
    }
}
