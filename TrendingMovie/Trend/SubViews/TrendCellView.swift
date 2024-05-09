//
//  TrendCellView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendCellView: View {
    
    let movie: TrendingMovieResult
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            TrendHeaderView(date: movie.releaseDate, genre: "\(movie.genres[0])")
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    BackDropImageView(imageURL: movie.backdrop)
                    VoteAverageView(voteAverage: movie.voteAverage)
                }
                TrendFooterView(title: movie.title, overview: movie.overview)
            } // VStack
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 5)
        } // LazyVStack
        .padding(.horizontal, 16)
    }
}
