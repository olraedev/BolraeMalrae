//
//  VerticalLine.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct VerticalLine: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                Divider()
            }
            .overlay(alignment: .bottom) {
                Divider()
            }
    }
}

extension View {
    func asVerticalLine() -> some View {
        modifier(VerticalLine())
    }
}
