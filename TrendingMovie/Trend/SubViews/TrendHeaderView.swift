//
//  TrendHeaderView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendHeaderView: View {
    let date: String
    let genre: String
    
    var body: some View {
        Text(date)
            .font(.caption)
            .foregroundStyle(.gray)
        Text(genre)
            .bold()
    }
}
