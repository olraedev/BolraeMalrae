//
//  VoteAverageView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct VoteAverageView: View {
    
    let voteAverage: Double
    
    var body: some View {
        HStack(spacing: 0) {
            Text("평점")
                .font(.caption)
                .padding(.all, 3)
                .background(.blue)
                .foregroundStyle(.white)
            Text(String(format: "%.1f", voteAverage))
                .font(.caption)
                .padding(.all, 3)
                .background(.white)
        }
        .offset(x: 16, y: -16)
    }
}
