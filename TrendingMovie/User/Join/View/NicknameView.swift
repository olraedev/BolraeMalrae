//
//  NicknameView.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/21/24.
//

import SwiftUI

struct NicknameView: View {
    
    @StateObject private var viewModel = NicknameViewModel()
    @EnvironmentObject private var appRootManager: AppRootManager
    @Binding var nicknameView: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("닉네임을 입력해주세요")
                .padding(.top, 100)
                .font(.title)
                .bold()
            CustomTextField(placeholder: "닉네임", textFieldText: $viewModel.input.textFieldText.value)
            Text(viewModel.output.validation ? "사용 가능한 닉네임입니다." : "2자 이상 8자 미만")
                .foregroundStyle(viewModel.output.validation ? .customPrimary : .red)
                .bold()
                .padding(.leading, 8)
        }
        .padding(.horizontal, 16)
        
        Spacer()
        VStack {
            ProgressView(value: 1) {
                Text("3/3")
                    .foregroundStyle(.gray)
            }
            .padding(.bottom, 8)
            .tint(.customPrimary)
            NextButtonView(title: "완료", validation: viewModel.output.validation)
                .wrapToButton {
                    appRootManager.temp.nickname = viewModel.input.textFieldText.value
                    viewModel.input.completeButtonClicked.send(appRootManager.temp)
                }
                .disabled(!viewModel.output.validation)
        }
        .padding(.horizontal, 16)
        .ignoresSafeArea(.keyboard)
        .alert(viewModel.output.isComplete ? "회원가입 성공" : "회원가입 실패", isPresented: $viewModel.output.alertTrigger) {
            Button {
                nicknameView.toggle()
            } label: {
                Text("확인")
            }
            .environmentObject(appRootManager)
        }
    }
}
