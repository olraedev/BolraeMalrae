//
//  FavoriteInfoView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/14/24.
//

import SwiftUI

struct FavoriteInfoView: View {
    
    @ObservedObject private var viewModel: ConfigureFavoriteViewModel
    
    init(viewModel: ConfigureFavoriteViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(viewModel.output.movie.releaseDate)
                    .font(.caption)
                    .foregroundStyle(.gray)
                Spacer()
                Image(systemName: viewModel.output.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(.customPrimary)
                    .wrapToButton {
                        viewModel.input.favoriteButtonClicked.send(())
                    }
            }
            .padding(.bottom, 3)
            Text(viewModel.output.movie.title)
                .lineLimit(1)
                .foregroundStyle(.black)
                .bold()
        }
        .padding(.horizontal, 8)
        .onAppear {
            viewModel.input.onAppearTrigger.send(())
        }
    }
}
