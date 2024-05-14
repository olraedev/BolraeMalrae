//
//  FavoriteView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct FavoriteView: View {
    
    private let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 40) {
                    ForEach(0..<10) { _ in
                        NavigationLink {
                            DetailView(movie: TrendingMovieResult(id: 823464, title: "고질라 X 콩: 뉴 엠파이어", overview: "overview", backdrop: "/lLh39Th5plbrQgbQ4zyIULsd0Pp.jpg", poster: "/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg", genres: [878, 28, 12], releaseDate: "2024-03-27", voteAverage: 6.8))
                        } label: {
                            VStack {
                                PosterView(imageURL: "/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg")
                                    .aspectRatio(0.8, contentMode: .fill)
                                    .clipShape(.rect(cornerRadius: 8))
                                    .padding(.bottom, 3)
                                FavoriteInfoView(date: "2024-03-27", title: "고질라")
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
    }
}

#Preview {
    FavoriteView()
}
