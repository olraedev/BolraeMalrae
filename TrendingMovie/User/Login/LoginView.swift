//
//  LoginView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/17/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 70)
                    .padding(.top, 100)
                CustomTextField(placeholder: "이메일", textFieldText: $viewModel.input.email.value)
                    .padding(.top, 40)
                CustomTextField(placeholder: "비밀번호", textFieldText: $viewModel.input.password.value)
                    .padding(.top, 8)
                PointColorButtonView(title: "로그인")
                    .padding(.top, 24)
                    .wrapToButton {
                        viewModel.input.loginButtonClicked.send(())
                    }
                    .alert("환영합니다", isPresented: $viewModel.output.isEnableLogin) {
                        Button {
                            withAnimation(.spring()) {
                                appRootManager.currentRoot = .home
                            }
                        } label: {
                            Text("확인")
                        }
                    }
                NavigationLink {
                    JoinView()
                } label: {
                    Text("아직 회원이 아니신가요?")
                        .font(.caption)
                        .foregroundStyle(.customPrimary)
                        .padding(.top, 8)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
