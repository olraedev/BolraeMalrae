//
//  FavoriteInfoView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/14/24.
//

import SwiftUI

struct FavoriteInfoView: View {
    
    @StateObject private var viewModel = ConfigureFavoriteViewModel()
    let movie: CommonMovieList
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(movie.releaseDate)
                    .font(.caption)
                    .foregroundStyle(.gray)
                Spacer()
                Image(systemName: viewModel.output.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(.customPrimary)
                    .wrapToButton {
                        viewModel.input.favoriteButtonClicked.send(movie)
                    }
            }
            .padding(.bottom, 3)
            Text(movie.title)
                .lineLimit(1)
                .foregroundStyle(.black)
                .bold()
        }
        .padding(.horizontal, 8)
        .onAppear {
            viewModel.input.onAppearTrigger.send(movie.id)
        }
    }
}
