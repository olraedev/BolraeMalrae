//
//  JoinView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/18/24.
//

import SwiftUI

struct EmailView: View {
    
    @StateObject private var viewModel = JoinViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CustomTextField(placeholder: "이메일", textFieldText: $viewModel.input.textFieldText.value)
                Text("중복확인")
                    .frame(width: 100, height: 50)
                    .wrapToButton {
                        viewModel.input.validationButtonTrigger.send(())
                    }
                    .disabled(!viewModel.output.validation)
                    .background(viewModel.output.validation ? .customPrimary : .gray.opacity(0.2))
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
            }
            .padding(.top, 100)
            Text(viewModel.output.validation ? (viewModel.output.emailValidation ? "사용가능한 이메일 입니다" : "중복 확인을 해주세요") : "이메일 형식을 확인해주세요")
                .foregroundStyle(viewModel.output.emailValidation ? .customPrimary : .red)
                .bold()
                .padding(.leading, 8)
                .alert("중복된 이메일입니다", isPresented: $viewModel.output.alertTrigger) {
                }
        }
        .padding(.horizontal, 16)
        
        Spacer()
        VStack {
            ProgressView(value: 0.3) {
                Text("1/3")
                    .foregroundStyle(.gray)
            }
            .padding(.bottom, 8)
            .tint(.customPrimary)
            NavigationLink {
                PasswordView()
            } label: {
                NextButtonView(validation: viewModel.output.emailValidation)
            }
            .disabled(!viewModel.output.emailValidation)
        }
        .padding(.horizontal, 16)
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    EmailView()
}
