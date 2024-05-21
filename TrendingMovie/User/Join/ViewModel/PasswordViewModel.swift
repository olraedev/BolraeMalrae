//
//  PasswordViewModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/21/24.
//

import Foundation
import Combine

final class PasswordViewModel: ViewModelType {
    
    var cancellable = Set<AnyCancellable>()
    
    var input: Input
    @Published var output: Output
    
    init() {
        input = Input()
        output = Output()
        transform()
    }
}

extension PasswordViewModel {
    struct Input {
        var textFieldText = CurrentValueSubject<String, Never>("")
    }
    
    struct Output {
        var validation = false
    }
}

extension PasswordViewModel {
    func transform() {
        input.textFieldText
            .map { 3 < $0.count && $0.count < 10 }
            .sink { [weak self] state in
                guard let self else { return }
                
                self.output.validation = state
            }
            .store(in: &cancellable)
    }
}
