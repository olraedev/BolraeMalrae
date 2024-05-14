//
//  FavoriteModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/14/24.
//

import Foundation
import RealmSwift

final class FavoriteModel: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String
    @Persisted var overview: String
    @Persisted var backdrop: String
    @Persisted var poster: String
    @Persisted var genres: List<Int>
    @Persisted var releaseDate: String
    @Persisted var voteAverage: Double
    
    convenience init(id: Int, title: String, overview: String, backdrop: String, poster: String, genres: [Int], releaseDate: String, voteAverage: Double) {
        self.init()
        self.id = id
        self.title = title
        self.overview = overview
        self.backdrop = backdrop
        self.poster = poster
        self.genres.append(objectsIn: genres)
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
    }
}
