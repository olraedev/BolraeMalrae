//
//  NicknameViewModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/21/24.
//

import Foundation
import Combine

final class NicknameViewModel: ViewModelType {
    
    var cancellable = Set<AnyCancellable>()
    
    var input: Input
    @Published var output: Output
    
    init() {
        input = Input()
        output = Output()
        transform()
    }
}

extension NicknameViewModel {
    struct Input {
        var textFieldText = CurrentValueSubject<String, Never>("")
        var completeButtonClicked = PassthroughSubject<AppRootManager.Temp, Never>()
    }
    
    struct Output {
        var validation = false
        var isComplete = false
        var alertTrigger = false
    }
}

extension NicknameViewModel {
    func transform() {
        input.textFieldText
            .map { 1 < $0.count && $0.count < 9 }
            .sink { [weak self] state in
                guard let self else { return }
                
                self.output.validation = state
            }
            .store(in: &cancellable)
        
        input.completeButtonClicked
            .sink { [weak self] data in
                guard let self else { return }
                let query = JoinQuery(email: data.email, password: data.password, nick: data.nickname)
                
                Task {
                    guard let result = await self.requestToServer(model: JoinModel.self, router: UserRouter.join(JoinQuery: query)) else {
                        await MainActor.run {
                            self.output.isComplete = false
                            self.output.alertTrigger = true
                        }
                        return
                    }
                    
                    await MainActor.run {
                        self.output.isComplete = true
                        self.output.alertTrigger = true
                    }
                }
            }
            .store(in: &cancellable)
    }
}
