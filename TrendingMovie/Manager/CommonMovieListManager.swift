//
//  CommonMovieListManager.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/14/24.
//

import Foundation

struct CommonMovieList {
    let id: Int
    let title: String
    let overview: String
    let backdrop: String
    let poster: String
    let genres: [Int]
    let releaseDate: String
    let voteAverage: Double
    let originalTitle: String
}

final class CommonMovieListManager {
        
    static let shared = CommonMovieListManager()
    private init() { }
    
    func tmdbModelToCommonList(_ list: [TrendingMovieResult]) -> [CommonMovieList] {
        var resultList: [CommonMovieList] = []
        
        list.forEach { result in
            resultList.append(
                CommonMovieList(id: result.id, title: result.title, overview: result.overview, backdrop: result.backdrop, poster: result.poster, genres: result.genres, releaseDate: result.releaseDate, voteAverage: result.voteAverage, originalTitle: result.originalTitle)
            )
        }
        
        return resultList
    }
    
    func realmModelToCommonList(_ list: [FavoriteModel]) -> [CommonMovieList] {
        var resultList: [CommonMovieList] = []
        
        list.forEach { result in
            resultList.append(
                CommonMovieList(id: result.id, title: result.title, overview: result.overview, backdrop: result.backdrop, poster: result.poster, genres: Array(result.genres), releaseDate: result.releaseDate, voteAverage: result.voteAverage, originalTitle: result.originalTitle)
            )
        }
        
        return resultList
    }
    
    func commonListToRealmModel(_ list: CommonMovieList) -> FavoriteModel {
        return FavoriteModel(id: list.id, title: list.title, overview: list.overview, backdrop: list.backdrop, poster: list.poster, genres: list.genres, releaseDate: list.releaseDate, voteAverage: list.voteAverage, originalTitle: list.originalTitle)
    }
}
