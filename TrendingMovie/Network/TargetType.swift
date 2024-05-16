//
//  TargetType.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import Foundation

protocol TargetType {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var header: [String: String] { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
}

extension TargetType {
    func asURLRequest() -> URLRequest {
        let url = URL(string: APIKey.movieBaseURL)!
        var urlRequest: URLRequest
        
        if let queryItems {
            urlRequest = URLRequest(url: url.appending(path: path).appending(queryItems: queryItems))
        } else {
            urlRequest = URLRequest(url: url.appending(path: path))
        }
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = header
        
        print(urlRequest)
        return urlRequest
    }
}
