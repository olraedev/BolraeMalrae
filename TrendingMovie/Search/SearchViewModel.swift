//
//  SearchViewModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/28/24.
//

import Foundation
import Combine

final class SearchViewModel: ViewModelType {
    
    var cancellable = Set<AnyCancellable>()
    
    var input: Input
    @Published var output: Output
    
    init() {
        self.input = Input()
        self.output = Output()
        transform()
    }
}

extension SearchViewModel {
    struct Input {
        var searchText = CurrentValueSubject<String, Never>("")
        let searchTrigger = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var movieList: [CommonMovieList] = []
    }
}

extension SearchViewModel {
    func transform() {
        input.searchTrigger
            .sink { [weak self] _ in
                guard let self else { return }
                
                Task {
                    let result = await self.requestToServer(model: TrendingMovieModel.self, router: TMDBRouter.search(searchQuery: self.input.searchText.value))
                    
                    await MainActor.run {
                        guard let result else {
                            self.output.movieList = []
                            return
                        }
                        self.output.movieList = CommonMovieListManager.shared.tmdbModelToCommonList(result.results)
                    }
                }
            }
            .store(in: &cancellable)
        
        input.searchText
            .filter { $0.isEmpty }
            .sink { [weak self] _ in
                guard let self else { return }
                
                self.output.movieList = []
            }
            .store(in: &cancellable)
    }
}
