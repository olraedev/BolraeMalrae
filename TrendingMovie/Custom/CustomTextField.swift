//
//  CustomTextField.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/18/24.
//

import SwiftUI

struct CustomTextField: View {
    
    let placeholder: String
    @Binding var textFieldText: String
    
    var body: some View {
        TextField(placeholder, text: $textFieldText)
            .textFieldStyle(.roundedBorder)
            .textInputAutocapitalization(.never)
    }
}
