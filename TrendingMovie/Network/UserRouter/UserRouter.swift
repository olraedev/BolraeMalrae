//
//  UserRouter.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/16/24.
//

import Foundation

enum UserRouter {
    case emailValidation(EmailQuery: Encodable)
    case join(JoinQuery: Encodable)
    case login(LoginQuery: Encodable)
    case authRefresh
}

extension UserRouter: TargetType {
    var baseURL: String {
        return APIKey.serverBaseURL
    }
    
    var method: HTTPMethod {
        switch self {
        case .emailValidation, .join, .login: .post
        case .authRefresh: .get
        }
    }
    
    var path: String {
        switch self {
        case .emailValidation: "/validation/email"
        case .join: "/users/join"
        case .login: "/users/login"
        case .authRefresh: "/auth/refresh"
        }
    }
    
    var header: [String : String] {
        return [HTTPHeader.contentType.rawValue: HTTPHeader.json.rawValue,
                HTTPHeader.sesacKey.rawValue: APIKey.secretKey]
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var body: Data? {
        let encoder = JSONEncoder()
        
        switch self {
        case .emailValidation(let query), .join(let query), .login(let query):
            encoder.keyEncodingStrategy = .convertToSnakeCase
            return try? encoder.encode(query)
        default: return nil
        }
    }
}
