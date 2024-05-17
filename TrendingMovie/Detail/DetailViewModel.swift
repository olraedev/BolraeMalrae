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
    
    var input: Input = Input()
    @Published var output: Output
    
    init(movie: CommonMovieList) {
        output = Output(movie: movie)
        transform()
    }
}

extension DetailViewModel {
    struct Input {
        let viewOnAppear = PassthroughSubject<Int, Never>()
    }
    
    struct Output {
        let movie: CommonMovieList
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
            let result = try await NetworkManager.shared.requestToAPI(model: CreditModel.self, router: TMDBRouter.credit(movieID: movieID)).cast
            await MainActor.run {
                output.castList = result
            }
        } catch {
            
        }
    }
}
