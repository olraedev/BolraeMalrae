//
//  CreditModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import Foundation

struct CreditModel: Decodable {
    let id: Int
    let cast: [Cast]
}

struct Cast: Decodable {
    let id: Int
    let name: String
    let character: String
    let profile: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case character
        case profile = "profile_path"
    }
}
