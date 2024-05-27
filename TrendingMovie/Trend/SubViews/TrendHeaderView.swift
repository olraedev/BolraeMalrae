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
                findGenre()
            }
        }
        .padding(.leading, 8)
    }
    
    private func findGenre() -> some View {
        ForEach(genre, id: \.self) { genre in
            if let text = GenreManager.shared.genres[genre] {
                Text("#\(text)").bold()
            } else {
                Text("")
            }
        }
    }
}
