//
//  BackDropImageView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct BackDropImageView: View {
    
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
        .frame(maxWidth: .infinity, maxHeight: 200)
    }
    
    init(imageURL: String) {
        self.imageURL = APIKey.imageURL + imageURL
    }
}
