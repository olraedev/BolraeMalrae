//
//  PasswordView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/21/24.
//

import SwiftUI

struct PasswordView: View {
    
    @StateObject private var viewModel = PasswordViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            SecureField(text: $viewModel.input.textFieldText.value) {
                Text("비밀번호")
            }
            .textFieldStyle(.roundedBorder)
            .padding(.top, 100)
            Text(viewModel.output.validation ? "사용 가능한 비밀번호 입니다." : "4자 이상 10자 미만")
                .foregroundStyle(viewModel.output.validation ? .customPrimary : .red)
                .bold()
                .padding(.leading, 8)
        }
        .padding(.horizontal, 16)
        
        Spacer()
        VStack {
            ProgressView(value: 0.6) {
                Text("2/3")
                    .foregroundStyle(.gray)
            }
            .padding(.bottom, 8)
            .tint(.customPrimary)
            NavigationLink {
                NicknameView()
            } label: {
                NextButtonView(validation: viewModel.output.validation)
            }
            .disabled(!viewModel.output.validation)
        }
        .padding(.horizontal, 16)
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    PasswordView()
}
