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
                // Network 통신 후 output으로 값 전달
                guard let self = self else { return }
                Task {
                    try? await self.fetchTrendingMovie()
                }
            }
            .store(in: &cancellable)
    }
    
    private func fetchTrendingMovie() async throws {
        do {
            output.trendingMovieList = try await NetworkManager.shared.requestToTmdbAPI(model: TrendingMovieModel.self, router: TrendRouter.trendingMovie(timeWindow: .day)).results
        } catch {
            output.trendingMovieList = []
        }
    }
}
