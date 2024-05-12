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
                    .frame(maxWidth: .infinity)
            case .success(let image):
                image
                    .resizable()
                    .frame(maxWidth: .infinity)
            default:
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .background(.white)
            }
        }
    }
    
    init(imageURL: String) {
        self.imageURL = APIKey.imageURL + imageURL
    }
}
