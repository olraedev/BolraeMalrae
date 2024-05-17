//
//  PointColorButtonView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/16/24.
//

import SwiftUI

struct PointColorButtonView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.customPrimary)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 10))
    }
}
