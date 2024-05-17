//
//  TrendViewModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import Foundation
import Combine

final class TrendViewModel: ViewModelType {
    
    var cancellable = Set<AnyCancellable>()
    
    var input = Input()
    @Published var output = Output()
    
    init() {
        transform()
    }
}

extension TrendViewModel {
    struct Input {
        let viewOnAppear = PassthroughSubject<Void, Never>()
        var selected = CurrentValueSubject<TimeWindow, Never>(TimeWindow.day)
    }
    
    struct Output {
        var trendingMovieList: [CommonMovieList] = []
        var menus = TimeWindow.allCases
    }
}

extension TrendViewModel {
    func transform() {
        input.viewOnAppear
            .sink { [weak self] _ in
                guard let self = self else { return }
                Task {
                    await self.fetchMoviesGenre()
                    await self.fetchTrendingMovie(timeWindow: .day)
                }
            }
            .store(in: &cancellable)
        
        input.selected
            .sink { [weak self] timeWindow in
                guard let self else { return }
                Task {
                    await self.fetchTrendingMovie(timeWindow: timeWindow)
                }
            }
            .store(in: &cancellable)
    }
    
    private func fetchTrendingMovie(timeWindow: TimeWindow) async {
        do {
            let data = try await NetworkManager.shared.requestToAPI(model: TrendingMovieModel.self, router: TMDBRouter.trendingMovie(timeWindow: timeWindow)).results
            await MainActor.run {
                output.trendingMovieList = CommonMovieListManager.shared.tmdbModelToCommonList(data)
            }
        } catch {
            output.trendingMovieList = []
        }
    }
    
    private func fetchMoviesGenre() async {
        do {
            let result = try await NetworkManager.shared.requestToAPI(model: GenreModel.self, router: TMDBRouter.genre).genres
            await MainActor.run {
                GenreManager.shared.configureGenres(result)
            }
        } catch {
            
        }
    }
}
