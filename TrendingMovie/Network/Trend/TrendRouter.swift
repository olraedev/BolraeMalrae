//
//  TrendRouter.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import Foundation

enum TrendRouter {
    case trendingMovie(time: String)
}

extension TrendRouter: TargetType {
    var baseURL: String {
        return APIKey.baseURL
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .trendingMovie(let time): "/trending/movie/\(time)"
        }
    }
    
    var header: [String : String] {
        return [HTTPHeader.authorization.rawValue: APIKey.accessToken,
                HTTPHeader.accept.rawValue: HTTPHeader.json.rawValue]
    }
    
    var queryItems: [URLQueryItem]? {
        return [URLQueryItem(name: "language", value: "ko-KR")]
    }
    
    var body: Data? {
        return nil
    }
}
