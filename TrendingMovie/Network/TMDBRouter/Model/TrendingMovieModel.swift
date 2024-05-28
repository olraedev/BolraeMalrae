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
    let originalTitle: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case backdrop = "backdrop_path"
        case poster = "poster_path"
        case genres = "genre_ids"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case originalTitle = "original_title"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.overview = try container.decode(String.self, forKey: .overview)
        self.backdrop = try container.decodeIfPresent(String.self, forKey: .backdrop) ?? ""
        self.poster = try container.decode(String.self, forKey: .poster)
        self.genres = try container.decode([Int].self, forKey: .genres)
        self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
        self.voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        self.originalTitle = try container.decode(String.self, forKey: .originalTitle)
    }
}
