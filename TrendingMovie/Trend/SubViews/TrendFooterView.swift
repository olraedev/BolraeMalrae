//
//  TrendFooterView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendFooterView: View {
    
    let title: String
    let overview: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
            Text(overview)
                .font(.caption)
                .lineLimit(1)
            Rectangle()
                .frame(height: 1)
            Spacer()
            HStack {
                Text("자세히 보기")
                    .font(.caption)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.caption)
            }
        }
        .padding()
    }
}
