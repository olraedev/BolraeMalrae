//
//  TrendCellView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendCellView: View {
    
    @ObservedObject private var viewModel: ConfigureFavoriteViewModel
    
    init(viewModel: ConfigureFavoriteViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            TrendHeaderView(date: viewModel.output.movie.releaseDate, genre: viewModel.output.movie.genres)
            LazyVStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    BackDropImageView(imageURL: viewModel.output.movie.backdrop)
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
                                    viewModel.input.favoriteButtonClicked.send(())
                                }
                        }
                        Spacer()
                        HStack {
                            VoteAverageView(voteAverage: viewModel.output.movie.voteAverage)
                            Spacer()
                        }
                    }
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    
                }
                TrendFooterView(title: viewModel.output.movie.title,
                                overview: viewModel.output.movie.overview, 
                                info: viewModel.output.movie)
            } // VStack
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 5)
        } // LazyVStack
        .padding(.horizontal, 16)
        .onAppear {
            viewModel.input.onAppearTrigger.send(())
        }
    }
}
