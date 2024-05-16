//
//  TrendingMovieModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import Foundation

struct TrendingMovieModel: Decodable {
    let results: [TrendingMovieResult]
}

struct TrendingMovieResult: Hashable, Decodable {
    let id: Int
    let title: String
    let overview: String
    let backdrop: String
    let poster: String
    let genres: [Int]
    let releaseDate: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case backdrop = "backdrop_path"
        case poster = "poster_path"
        case genres = "genre_ids"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
