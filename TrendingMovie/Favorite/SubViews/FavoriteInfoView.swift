//
//  FavoriteInfoView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/14/24.
//

import SwiftUI

struct FavoriteInfoView: View {
    
    let date: String
    let title: String
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(date)
                    .font(.caption)
                    .foregroundStyle(.gray)
                Spacer()
                Image(systemName: "heart.fill")
                    .foregroundStyle(.customPrimary)
            }
            .padding(.bottom, 3)
            Text(title)
                .lineLimit(1)
                .foregroundStyle(.black)
                .bold()
        }
        .padding(.horizontal, 8)
    }
}
