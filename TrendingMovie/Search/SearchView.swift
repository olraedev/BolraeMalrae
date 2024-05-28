//
//  SearchView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/28/24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.output.movieList, id: \.self) { movie in
                NavigationLink(value: movie) {
                    HStack(alignment: .center, spacing: 16) {
                        PosterView(imageURL: movie.poster)
                            .clipShape(.rect(cornerRadius: 8))
                            .frame(width: 90, height: 120)
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.system(size: 18))
                                .lineLimit(1)
                            HStack(spacing: 8) {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.customSecondary)
                                Text(String(format: "%.1f", movie.voteAverage))
                                    .foregroundStyle(.black)
                                    .font(.callout)
                            }
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .navigationDestination(for: CommonMovieList.self) { movie in
                DetailView(viewModel: DetailViewModel(movie: movie))
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .navigationTitle("Search")
            .searchable(text: $viewModel.input.searchText.value, placement: .navigationBarDrawer, prompt: "영화 제목")
            .onSubmit(of: .search) {
                viewModel.input.searchTrigger.send(())
            }
        }
    }
}

#Preview {
    SearchView()
}
