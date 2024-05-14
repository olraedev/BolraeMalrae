//
//  TrendCellViewModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/14/24.
//

import Foundation
import Combine

final class TrendCellViewModel: ViewModelType {
    
    var cancellable = Set<AnyCancellable>()
    
    var input = Input()
    @Published var output = Output()
    
    init() {
        transform()
    }
}

extension TrendCellViewModel {
    struct Input {
        let onAppearTrigger = PassthroughSubject<Int, Never>()
        let favoriteButtonClicked = PassthroughSubject<CommonMovieList, Never>()
    }
    
    struct Output {
        var isFavorite = false
    }
}

extension TrendCellViewModel {
    func transform() {
        input.onAppearTrigger
            .sink { [weak self] primaryKey in
                guard let self else { return }
                self.output.isFavorite = RealmRepository.shared.readSpecificFavorite(primaryKey)
            }
            .store(in: &cancellable)
        
        input.favoriteButtonClicked
            .sink { [weak self] movie in
                guard let self else { return }
                // 좋아요 취소
                if self.output.isFavorite {
                    RealmRepository.shared.deleteFromFavoriteList(movie.id)
                    self.output.isFavorite = false
                } else {
                    let favoriteList = CommonMovieListManager.shared.commonListToRealmModel(movie)
                    RealmRepository.shared.updateToFavoriteList(favoriteList)
                    self.output.isFavorite = true
                }
            }
            .store(in: &cancellable)
    }
}
