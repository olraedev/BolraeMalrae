//
//  FavoriteViewModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/14/24.
//

import Foundation
import Combine

final class FavoriteViewModel: ViewModelType {
    
    var cancellable = Set<AnyCancellable>()
    
    var input: Input = Input()
    @Published var output: Output = Output()
    
    init() { transform() }
}

extension FavoriteViewModel {
    struct Input {
        let viewOnAppearTrigger = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var favoriteList: [CommonMovieList] = []
    }
}

extension FavoriteViewModel {
    func transform() {
        input.viewOnAppearTrigger
            .sink { [weak self] _ in
                guard let self else { return }
                
                self.readFavoriteList()
            }
            .store(in: &cancellable)
    }
}

extension FavoriteViewModel {
    private func readFavoriteList() {
        let favoriteList = RealmRepository.shared.readAllFavoriteList()
        
        output.favoriteList = CommonMovieListManager.shared.realmModelToCommonList(favoriteList)
    }
}
