//
//  DetailView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject private var viewModel = DetailViewModel()
    let movie: CommonMovieList
    
    var body: some View {
        NavigationStack {
            ScrollView {
                DetailHeaderView(backdrop: movie.backdrop, poster: movie.poster)
                
                Section {
                    OverviewView(overView: movie.overview)
                } header: {
                    SectionHeaderView(title: "Overview")
                }
                .padding(.horizontal, 16)
                
                Section {
                    ForEach(viewModel.output.castList, id: \.id) { cast in
                        CastView(profile: cast.profile ?? "", name: cast.name, character: cast.character)
                    }
                    .overlay(alignment: .top) {
                        Divider()
                    }
                } header: {
                    SectionHeaderView(title: "Cast")
                }
                .padding(.horizontal, 16)

            } // ScrollView
            .navigationTitle(movie.title)
            .navigationBarTitleDisplayMode(.inline)
        } // NavigationStack
        .task {
            viewModel.input.viewOnAppear.send(movie.id)
        }
    }
}
