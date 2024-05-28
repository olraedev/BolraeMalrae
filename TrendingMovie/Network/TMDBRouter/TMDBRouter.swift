//
//  TrendRouter.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import Foundation

enum TMDBRouter {
    case trendingMovie(timeWindow: TimeWindow)
    case genre
    case credit(movieID: Int)
    case search(searchQuery: String)
}

extension TMDBRouter: TargetType {
    var baseURL: String {
        return APIKey.movieBaseURL
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .trendingMovie(let timeWindow): "/trending/movie/\(timeWindow.rawValue)"
        case .genre: "/genre/movie/list"
        case .credit(let movieID): "/movie/\(movieID)/credits"
        case .search: "/search/movie"
        }
    }
    
    var header: [String : String] {
        return [HTTPHeader.authorization.rawValue: APIKey.accessToken,
                HTTPHeader.accept.rawValue: HTTPHeader.json.rawValue]
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .search(let searchQuery):
            return [
                URLQueryItem(name: "query", value: searchQuery),
                URLQueryItem(name: "language", value: "ko-KR")
            ]
        default:
            return [URLQueryItem(name: "language", value: "ko-KR")]
        }
    }
    
    var body: Data? {
        return nil
    }
}
