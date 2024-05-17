//
//  JoinView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/16/24.
//

import SwiftUI

struct JoinView: View {
    
    @StateObject private var viewModel = JoinViewModel()
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                EmailView(validation: viewModel.output.emailValidation, textFieldText: $viewModel.input.email.value, isPressed: $viewModel.input.emailButtonClicked.value)
                    .focused($isFocused)
                PasswordView(validation: viewModel.output.passwordValidation, textFieldText: $viewModel.input.password.value)
                    .focused($isFocused)
                NicknameView(validation: viewModel.output.nicknameValidation, textFieldText: $viewModel.input.nickname.value)
                    .focused($isFocused)
                Spacer()
                PointColorButtonView(title: "회원가입")
                    .wrapToButton {
                        viewModel.input.joinButtonClicked.send(())
                    }
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                    .disabled(viewModel.output.joinButtonState)
            }
            .padding(.top, 56)
            .padding(.horizontal, 16)
            .navigationTitle("회원가입")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onTapGesture {
            isFocused = false
        }
    }
}

#Preview {
    JoinView()
}
