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
    }
    
    struct Output {
        var trendingMovieList: [TrendingMovieResult] = []
    }
}

extension TrendViewModel {
    func transform() {
        input.viewOnAppear
            .sink { [weak self] _ in
                guard let self = self else { return }
                Task {
                    try? await self.fetchMoviesGenre()
                    try? await self.fetchTrendingMovie()
                }
            }
            .store(in: &cancellable)
    }
    
    private func fetchTrendingMovie() async throws {
        do {
            let data = try await NetworkManager.shared.requestToTmdbAPI(model: TrendingMovieModel.self, router: Router.trendingMovie(timeWindow: .day)).results
            await MainActor.run {
                output.trendingMovieList = data
            }
        } catch {
            output.trendingMovieList = []
        }
    }
    
    private func fetchMoviesGenre() async throws {
        do {
            let result = try await NetworkManager.shared.requestToTmdbAPI(model: GenreModel.self, router: Router.genre).genres
            await MainActor.run {
                GenreManager.shared.configureGenres(result)
            }
        } catch {
            
        }
    }
}
