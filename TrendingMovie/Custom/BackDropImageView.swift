//
//  BackDropImageView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct BackDropImageView: View {
    var body: some View {
        Image(systemName: "star")
            .resizable()
            .frame(width: .infinity, height: 200)
            .background(.green)
    }
}
