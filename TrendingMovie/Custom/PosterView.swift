//
//  PosterView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct PosterView: View {
    
    let imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { data in
            switch data {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
            default:
                Rectangle()
                    .background(.white)
            }
        }
    }
    
    init(imageURL: String) {
        self.imageURL = APIKey.imageURL + imageURL
    }
}
