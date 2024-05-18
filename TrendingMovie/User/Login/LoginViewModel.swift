//
//  LoginViewModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/18/24.
//

import Foundation
import Combine

final class LoginViewModel: ViewModelType {
    
    var cancellable = Set<AnyCancellable>()
    
    var input: Input
    @Published var output: Output
    
    init() {
        input = Input()
        output = Output()
        transform()
    }
}

extension LoginViewModel {
    struct Input {
        var email = CurrentValueSubject<String, Never>("")
        var password = CurrentValueSubject<String, Never>("")
        let loginButtonClicked = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var isEnableLogin = false
    }
}

extension LoginViewModel {
    func transform() {
        input.loginButtonClicked
            .sink { [weak self] _ in
                guard let self else { return }
                let query = LoginQuery(email: self.input.email.value, password: self.input.password.value)
                
                Task {
                    guard let result = await self.requestToServer(model: LoginModel.self, router: UserRouter.login(LoginQuery: query)) else {
                        await MainActor.run {
                            self.output.isEnableLogin = false
                        }
                        return
                    }
                    
                    UserDefaultsManager.userID = result.userID
                    UserDefaultsManager.accessToken = result.accessToken
                    UserDefaultsManager.refreshToken = result.refreshToken
                    await MainActor.run {
                        self.output.isEnableLogin = true
                    }
                }
            }
            .store(in: &cancellable)
    }
}
