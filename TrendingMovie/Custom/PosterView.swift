//
//  PosterView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI
import Kingfisher

struct PosterView: View {
    
    let imageURL: String
    
    var body: some View {
        KFImage.url(URL(string: imageURL))
            .cancelOnDisappear(true)
            .resizable()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .placeholder { _ in
                ProgressView()
            }
            .frame(maxWidth: .infinity)
            .onDisappear {
                ImageCache.default.clearMemoryCache()
            }
    }
    
    init(imageURL: String) {
        self.imageURL = APIKey.movieImageURL + imageURL
    }
}
