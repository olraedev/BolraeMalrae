//
//  DetailView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject private var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack {
                    DetailHeaderView(viewModel: ConfigureFavoriteViewModel(movie: viewModel.output.movie))
                    
                    Section {
                        OverviewView(overView: viewModel.output.movie.overview)
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
                }
            } // ScrollView
            .toolbar(.hidden, for: .navigationBar)
            .ignoresSafeArea(.container, edges: .top)
        } // NavigationStack
        .task {
            viewModel.input.viewOnAppear.send(viewModel.output.movie.id)
        }
    }
}
