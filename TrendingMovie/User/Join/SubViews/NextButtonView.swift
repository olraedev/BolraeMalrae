//
//  NextButtonView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/21/24.
//

import SwiftUI

struct NextButtonView: View {
    
    var title: String
    var validation: Bool
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(validation ? .customPrimary : .gray.opacity(0.2))
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 10))
    }
}
