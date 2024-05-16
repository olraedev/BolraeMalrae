//
//  TrendCellViewModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/14/24.
//

import Foundation
import Combine

final class ConfigureFavoriteViewModel: ViewModelType {
    
    var cancellable = Set<AnyCancellable>()
    
    var input: Input
    @Published var output: Output
    
    init(movie: CommonMovieList) {
        input = Input()
        output = Output(movie: movie)
        transform()
    }
}

extension ConfigureFavoriteViewModel {
    struct Input {
        let onAppearTrigger = PassthroughSubject<Void, Never>()
        let favoriteButtonClicked = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var movie: CommonMovieList
        var isFavorite = false
    }
}

extension ConfigureFavoriteViewModel {
    func transform() {
        input.onAppearTrigger
            .sink { [weak self] _ in
                guard let self else { return }
                self.output.isFavorite = RealmRepository.shared.readSpecificFavorite(output.movie.id)
            }
            .store(in: &cancellable)
        
        input.favoriteButtonClicked
            .sink { [weak self] _ in
                guard let self else { return }
                // 좋아요 취소
                if self.output.isFavorite {
                    RealmRepository.shared.deleteFromFavoriteList(output.movie.id)
                    self.output.isFavorite = false
                } else {
                    let favoriteList = CommonMovieListManager.shared.commonListToRealmModel(output.movie)
                    RealmRepository.shared.updateToFavoriteList(favoriteList)
                    self.output.isFavorite = true
                }
            }
            .store(in: &cancellable)
    }
}
