//
//  JoinModel.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/17/24.
//

import Foundation

struct JoinModel: Decodable {
    let userID: String
    let email: String
    let nick: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case email
        case nick
    }
}
