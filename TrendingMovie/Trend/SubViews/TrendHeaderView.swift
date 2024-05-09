//
//  TrendHeaderView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendHeaderView: View {
    
    let date: String
    let genre: [Int]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(date)
                .font(.caption)
                .foregroundStyle(.gray)
            HStack {
                ForEach(genre, id: \.self) { genre in
                    Text("#\(genre)")
                        .bold()
                }
            }
        }
        .padding(.leading, 8)
    }
}
