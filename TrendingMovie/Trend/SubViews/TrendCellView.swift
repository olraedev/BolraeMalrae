//
//  TrendCellView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendCellView: View {
    var body: some View {
        LazyVStack(alignment: .leading) {
            TrendHeaderView(date: "24/05/09", genre: "#Mystery")
            VStack {
                ZStack(alignment: .bottomLeading) {
                    BackDropImageView()
                    VoteAverageView()
                }
                TrendFooterView()
            } // VStack
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 10)
        } // LazyVStack
        .padding(.horizontal, 16)
    }
}
