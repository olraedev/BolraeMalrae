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
    }
    
    struct Output {
        var validation = false
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
    }
}
