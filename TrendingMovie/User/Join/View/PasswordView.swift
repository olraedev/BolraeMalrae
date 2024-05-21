//
//  PasswordView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/21/24.
//

import SwiftUI

struct PasswordView: View {
    
    @StateObject private var viewModel = PasswordViewModel()
    @EnvironmentObject private var appRootManager: AppRootManager
    @Binding var passwordView: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("비밀번호를 입력해주세요")
                .padding(.top, 100)
                .font(.title)
                .bold()
            SecureField(text: $viewModel.input.textFieldText.value) {
                Text("비밀번호")
            }
            .textFieldStyle(.roundedBorder)
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
                NicknameView(nicknameView: $passwordView)
            } label: {
                NextButtonView(title: "다음으로", validation: viewModel.output.validation)
            }
            .disabled(!viewModel.output.validation)
            .simultaneousGesture(TapGesture().onEnded { _ in
                appRootManager.temp.password = viewModel.input.textFieldText.value
            })
            .environmentObject(appRootManager)
        }
        .padding(.horizontal, 16)
        .ignoresSafeArea(.keyboard)
    }
}
