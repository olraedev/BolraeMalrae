//
//  PasswordView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/17/24.
//

import SwiftUI

struct PasswordView: View {
    
    let validation: Bool
    @Binding var textFieldText: String
    
    var body: some View {
        HStack {
            Text("비밀번호")
                .font(.callout)
                .padding(.leading, 8)
                .foregroundStyle(.customPrimary)
                .bold()
            Spacer()
        }
        HStack {
            SecureField("비밀번호", text: $textFieldText)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
        }
        HStack {
            Text(validation ? "사용 가능합니다" : "사용 불가능합니다")
                .font(.callout)
                .padding(.leading, 8)
                .foregroundStyle(validation ? .blue : .red)
            Spacer()
        }
        .padding(.bottom, 16)
    }
}

