//
//  NextButtonView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/21/24.
//

import SwiftUI

struct NextButtonView: View {
    
    var validation: Bool
    
    var body: some View {
        Text("다음으로")
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(validation ? .customPrimary : .gray.opacity(0.2))
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 10))
    }
}
