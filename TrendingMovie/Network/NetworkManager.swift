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
    
    @discardableResult
    func requestToAPI<D: Decodable, T: TargetType>(model: D.Type, router: T) async throws -> D {
        let (data, response) = try await URLSession.shared.data(for: router.asURLRequest())
        
        if let response = response as? HTTPURLResponse, response.statusCode != 200 {
            print("invalidResponse")
            
            // AccessToken Expired
            if response.statusCode == 419 {
                do {
                    let result = try await refreshToken()
                    
                    UserDefaultsManager.accessToken = result.accessToken
                    try await requestToAPI(model: model, router: router)
                } catch {
                    throw APIError.invalidResponse
                }
            } else {
                throw APIError.invalidResponse
            }
        }
        
        guard let data = try? JSONDecoder().decode(model.self, from: data) else {
            print("noData")
            throw APIError.noData
        }
        
        return data
    }
    
    private func refreshToken() async throws -> AuthRefreshModel {
        let (data, response) = try await URLSession.shared.data(for: UserRouter.authRefresh.asURLRequest())
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        guard let data = try? JSONDecoder().decode(AuthRefreshModel.self, from: data) else {
            throw APIError.noData
        }
        
        return data
    }
}
