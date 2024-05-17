//
//  EmailView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/17/24.
//

import SwiftUI

struct EmailView: View {
    
    let validation: Bool
    @Binding var textFieldText: String
    @Binding var isPressed: Bool
    @Binding var isDuplicated: Bool
    
    var body: some View {
        HStack {
            Text("이메일")
                .font(.callout)
                .padding(.leading, 8)
                .foregroundStyle(.customPrimary)
                .bold()
            Spacer()
        }
        HStack(spacing: 8) {
            TextField("bolrae@example.com", text: $textFieldText)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
            PointColorButtonView(title: "중복확인")
                .frame(width: 100)
                .disabled(!validation)
                .wrapToButton {
                    isPressed = true
                }
        }
        HStack {
            Text(validation ? "중복 확인을 해주세요" : "이메일 형식을 확인해주세요")
                .font(.callout)
                .padding(.leading, 8)
                .foregroundStyle(validation ? .blue : .red)
            Spacer()
        }
        .padding(.bottom, 16)
    }
}
