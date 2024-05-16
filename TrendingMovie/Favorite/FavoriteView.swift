//
//  FavoriteView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct FavoriteView: View {
    
    @StateObject private var viewModel = FavoriteViewModel()
    private let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 40) {
                    ForEach(viewModel.output.favoriteList, id: \.id) { movie in
                        NavigationLink {
                            DetailView(movie: movie)
                        } label: {
                            VStack {
                                PosterView(imageURL: movie.poster)
                                    .aspectRatio(0.7, contentMode: .fit)
                                    .clipShape(.rect(cornerRadius: 8))
                                    .padding(.bottom, 3)
                                FavoriteInfoView(movie: movie)
                            }
                        }
                    }
                } // LazyVGrid
            } // ScrollView
            .navigationTitle("Favorite")
            .padding(.top, 16)
            .padding(.horizontal, 16)
            .scrollIndicators(.never)
        } // NavigationStack
        .onAppear {
            viewModel.input.viewOnAppearTrigger.send(())
        }
    }
}

#Preview {
    FavoriteView()
}
