//
//  TrendFooterView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

struct TrendFooterView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("adfasdfasdf")
                .font(.title2)
            Text("adfasdfasdf")
                .font(.subheadline)
            Rectangle()
                .frame(height: 1)
            Spacer()
            HStack {
                Text("자세히 보기")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        .padding()
    }
}
