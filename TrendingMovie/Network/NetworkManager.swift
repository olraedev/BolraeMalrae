//
//  NetworkManager.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    func requestToTmdbAPI<D: Decodable, T: TargetType>(model: D.Type, router: T) async throws -> D {
        let (data, response) = try await URLSession.shared.data(for: router.asURLRequest())
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        guard let data = try? JSONDecoder().decode(model.self, from: data) else {
            throw APIError.noData
        }
        
        return data
    }
}
