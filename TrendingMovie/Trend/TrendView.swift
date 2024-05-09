//
//  TrendView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendView: View {
    
    @StateObject private var viewModel = TrendViewModel()
    private let columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 40) {
                    ForEach(viewModel.output.trendingMovieList, id: \.id) { item in
                        TrendCellView(movie: item)
                    }
                } // LazyVGrid
            } // ScrollView
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(.black)
                        .wrapToButton {
                            
                        }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.black)
                        .wrapToButton {
                            
                        }
                }
            } // .toolbar
        } // NavigationStack
        .task {
            viewModel.input.viewOnAppear.send(())
        }
    }
}

#Preview {
    TrendView()
}
