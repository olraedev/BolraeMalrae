//
//  TrendCellView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendCellView: View {
    
    @StateObject private var viewModel = TrendCellViewModel()
    let movie: CommonMovieList
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            TrendHeaderView(date: movie.releaseDate, genre: movie.genres)
            LazyVStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    BackDropImageView(imageURL: movie.backdrop)
                        .frame(height: 200)
                    
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: viewModel.output.isFavorite ? "heart.fill" : "heart")
                                .frame(width: 30, height: 30)
                                .background(.white)
                                .foregroundStyle(.customPrimary)
                                .clipShape(Circle())
                                .padding(.top, 16)
                                .padding(.trailing, 16)
                                .wrapToButton {
                                    viewModel.input.favoriteButtonClicked.send(movie)
                                }
                        }
                        Spacer()
                        HStack {
                            VoteAverageView(voteAverage: movie.voteAverage)
                            Spacer()
                        }
                    }
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    
                }
                TrendFooterView(title: movie.title, overview: movie.overview, 
                                info: movie)
            } // VStack
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 5)
        } // LazyVStack
        .padding(.horizontal, 16)
        .onAppear {
            viewModel.input.onAppearTrigger.send(movie.id)
        }
    }
}
