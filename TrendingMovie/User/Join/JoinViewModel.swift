//
//  JoinViewModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/16/24.
//

import Foundation
import Combine

final class JoinViewModel: ViewModelType {
    
    var cancellable = Set<AnyCancellable>()
    
    var input: Input
    @Published var output: Output
    
    init() {
        input = Input()
        output = Output()
        transform()
    }
}

extension JoinViewModel {
    struct Input {
        var email = CurrentValueSubject<String, Never>("")
        var password = CurrentValueSubject<String, Never>("")
        var nickname = CurrentValueSubject<String, Never>("")
        var joinButtonClicked = PassthroughSubject<Void, Never>()
        var emailButtonClicked = CurrentValueSubject<Bool, Never>(false)
    }
    
    struct Output {
        var emailValidation = false
        var passwordValidation = false
        var nicknameValidation = false
        var joinButtonState = false
    }
}

extension JoinViewModel {
    func transform() {
        let emailValidation = input.email
            .filter { !$0.isEmpty }
            .map { 0 < $0.count && self.checkEmailRegex(str: $0)}
        let passwordValidation = input.password
            .filter { !$0.isEmpty }
            .map { 3 < $0.count && $0.count < 10 }
        let nicknameValidation = input.nickname
            .filter { !$0.isEmpty }
            .map { 2 < $0.count && $0.count < 10 }
        let emailDuplication = CurrentValueSubject<Bool, Never>(false)
        
        emailValidation
            .sink { [weak self] validation in
                self?.output.emailValidation = validation
            }
            .store(in: &cancellable)
        
        passwordValidation
            .sink { [weak self] validation in
                self?.output.passwordValidation = validation
            }
            .store(in: &cancellable)
        
        nicknameValidation
            .sink { [weak self] validation in
                self?.output.nicknameValidation = validation
            }
            .store(in: &cancellable)
        
        input.emailButtonClicked
            .filter { $0 == true }
            .sink { [weak self] _ in
                guard let self else { return }
                Task {
                    let result = await self.checkEmailValidation()
                    emailDuplication.send(result)
                }
            }
            .store(in: &cancellable)
        
        emailValidation.combineLatest(passwordValidation, nicknameValidation, emailDuplication)
            .map { $0 && $1 && $2 && $3 }
            .filter { $0 == true }
            .sink { [weak self] _ in
                guard let self else { return }
                let query = JoinQuery(email: self.input.email.value, password: self.input.password.value, nick: self.input.nickname.value)
                Task {
                    await self.requestToServerForJoin(query)
                }
            }
            .store(in: &cancellable)
        
        input.joinButtonClicked
            .sink { _ in
                print(self.input.email.value)
            }
            .store(in: &cancellable)
    }
}

extension JoinViewModel {
    private func checkEmailRegex(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        return  NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
    
    private func checkEmailValidation() async -> Bool {
        do {
            let result = try await NetworkManager.shared.requestToAPI(model: MessageModel.self, router: UserRouter.emailValidation(EmailQuery: EmailQuery(email: input.email.value)))
            return true
        } catch {
            return false
        }
    }
    
    private func requestToServerForJoin(_ query: JoinQuery) async {
        do {
            let result = try await NetworkManager.shared.requestToAPI(model: JoinModel.self, router: UserRouter.join(JoinQuery: query))
        } catch {
            
        }
    }
}
