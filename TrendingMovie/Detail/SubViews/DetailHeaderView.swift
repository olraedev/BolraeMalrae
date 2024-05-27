//
//  DetailHeaderView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct DetailHeaderView: View {
    
    let backdrop: String
    let poster: String
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            BackDropImageView(imageURL: backdrop)
                .opacity(0.7)
                .frame(height: 250)
            PosterView(imageURL: poster)
                .clipShape(.rect(cornerRadius: 8))
                .frame(width: 90, height: 130)
                .padding(.trailing, 16)
                .padding(.bottom, 24)
        }
    }
}
