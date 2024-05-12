//
//  OverviewView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct OverviewView: View {
    
    @State private var showFullOverview = false
    let overView: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(overView)
                .lineLimit(showFullOverview ? nil : 3)
                .font(.callout)
                .padding(.bottom)
            Button {
                withAnimation(.easeInOut) {
                    showFullOverview.toggle()
                }
            } label: {
                Image(systemName: showFullOverview ? "chevron.up" : "chevron.down")
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .tint(.blue)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .asVerticalLine()
    }
}
