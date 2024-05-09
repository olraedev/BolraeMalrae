//
//  TrendView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendView: View {
    
    private let columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            LazyVGrid(columns: columns) {
                TrendCellView()
            }
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
    }
}

#Preview {
    TrendView()
}
