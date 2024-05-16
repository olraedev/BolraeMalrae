//
//  TrendFooterView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendFooterView: View {
    
    let title: String
    let overview: String
    let info: CommonMovieList
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .padding(.top, 8)
            Text(overview)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .padding(.bottom, 8)
            Rectangle()
                .frame(height: 1)
            NavigationLink {
                DetailView(viewModel: DetailViewModel(movie: info))
            } label: {
                HStack {
                    Text("자세히 보기")
                        .font(.callout)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.callout)
                }
                .foregroundStyle(.black)
            }
            .padding(.top, 8)
        }
        .padding()
    }
}
