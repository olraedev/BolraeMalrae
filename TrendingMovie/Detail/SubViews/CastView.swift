//
//  CastView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct CastView: View {
    
    let profile: String
    let name: String
    let character: String
    
    var body: some View {
        LazyHStack {
            PosterView(imageURL: profile)
                .clipShape(.rect(cornerRadius: 8))
                .padding(.top, 8)
                .frame(width: 50, height: 80)
            VStack(alignment: .leading) {
                Text(name)
                Text(character)
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 8)
            .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
