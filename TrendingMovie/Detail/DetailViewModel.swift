//
//  DetailViewModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import Foundation
import Combine

final class DetailViewModel: ViewModelType {
    
    var cancellable = Set<AnyCancellable>()
    
    var input = Input()
    @Published var output = Output()
    
    init() {
        transform()
    }
}

extension DetailViewModel {
    struct Input {
        let viewOnAppear = PassthroughSubject<Int, Never>()
    }
    
    struct Output {
        var castList: [Cast] = []
    }
}

extension DetailViewModel {
    func transform() {
        input.viewOnAppear
            .sink { [weak self] movieID in
                guard let self else { return }
                
                Task {
                    await self.fetchCastList(movieID)
                }
            }
            .store(in: &cancellable)
    }
    
    private func fetchCastList(_ movieID: Int) async {
        do {
            let result = try await NetworkManager.shared.requestToTmdbAPI(model: CreditModel.self, router: TMDBRouter.credit(movieID: movieID)).cast
            await MainActor.run {
                output.castList = result
            }
        } catch {
            
        }
    }
}
