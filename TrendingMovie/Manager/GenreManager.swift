//
//  GenreManager.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import Foundation

final class GenreManager {
    
    static let shared = GenreManager()
    var genres: [Int: String] = [:]
    
    private init() { }
    
    func configureGenres(_ genreList: [Genre]) {
        genreList.forEach { genre in
            genres.updateValue(genre.name, forKey: genre.id)
        }
    }
}
