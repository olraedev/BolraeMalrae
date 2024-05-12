//
//  TrendView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendView: View {
    
    @StateObject var viewModel = TrendViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Picker("", selection: $viewModel.input.selected.value) {
                    ForEach(viewModel.output.menus, id:\.self) { menu in
                        Text(menu.title)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
                LazyVGrid(columns: [GridItem(.flexible())], spacing: 40) {
                    ForEach(viewModel.output.trendingMovieList, id: \.id) { item in
                        TrendCellView(movie: item)
                    }
                } // LazyVGrid
            } // ScrollView
            .navigationTitle("Trending")
        } // NavigationStack
        .task {
            viewModel.input.viewOnAppear.send(())
        }
    }
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .customPrimary
        UISegmentedControl.appearance().backgroundColor = .customPrimary.withAlphaComponent(0.2)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
}

#Preview {
    TrendView()
}
