//
//  JoinViewModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/21/24.
//

import Foundation
import Combine

final class EmailViewModel: ViewModelType {
    
    var cancellable = Set<AnyCancellable>()
    
    var input: Input
    @Published var output: Output
    
    init() {
        input = Input()
        output = Output()
        transform()
    }
}

extension EmailViewModel {
    struct Input {
        var textFieldText = CurrentValueSubject<String, Never>("")
        var validationButtonTrigger = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var alertTrigger = false
        var emailValidation = false
        var validation = false
    }
}

extension EmailViewModel {
    func transform() {
        input.textFieldText
            .map { [weak self] text in
                guard let self else { return false }
                return self.checkEmailRegex(str: text)
            }
            .sink { state in
                self.output.validation = state
                if !state { self.output.emailValidation = state }
            }
            .store(in: &cancellable)
        
        input.validationButtonTrigger
            .throttle(for: 1, scheduler: RunLoop.main, latest: false)
            .sink { [weak self] _ in
                guard let self else { return }
                let query = EmailQuery(email: self.input.textFieldText.value)
                Task {
                    guard (await self.requestToServer(model: MessageModel.self, router: UserRouter.emailValidation(EmailQuery: query))) != nil else {
                        await MainActor.run {
                            self.output.emailValidation = false
                            self.output.alertTrigger = true
                        }
                        return
                    }
                    await MainActor.run {
                        self.output.emailValidation = true
                    }
                }
            }
            .store(in: &cancellable)
    }
}

extension EmailViewModel {
    private func checkEmailRegex(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
}
