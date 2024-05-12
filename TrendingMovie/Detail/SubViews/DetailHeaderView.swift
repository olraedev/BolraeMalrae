//
//  DetailHeaderView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct DetailHeaderView: View {
    
    let backdrop: String
    let movieTitle: String
    let poster: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            BackDropImageView(imageURL: backdrop)
            VStack(alignment: .leading) {
                Text(movieTitle)
                    .font(.title3)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.top, 16)
                PosterView(imageURL: poster)
                    .clipShape(.rect(cornerRadius: 8))
                    .frame(width: 90, height: 130)
            }
            .padding(.leading, 16)
        }
    }
}
