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
            TrendHeaderView(date: movie.releaseDate, genre: movie.genres)
            LazyVStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    BackDropImageView(imageURL: movie.backdrop)
                        .frame(height: 200)
                    VoteAverageView(voteAverage: movie.voteAverage)
                }
                TrendFooterView(title: movie.title, overview: movie.overview, 
                                info: movie)
            } // VStack
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 5)
        } // LazyVStack
        .padding(.horizontal, 16)
    }
}
