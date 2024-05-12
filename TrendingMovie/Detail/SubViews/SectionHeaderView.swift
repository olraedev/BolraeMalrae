//
//  SectionHeaderView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct SectionHeaderView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
                .font(.callout)
            Spacer()
        }
        .padding(.top, 16)
    }
}
