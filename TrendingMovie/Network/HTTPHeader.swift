//
//  HTTPHeader.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import Foundation

enum HTTPHeader: String {
    case authorization = "Authorization"
    case accept
    case json = "application/json"
    case contentType = "Content-Type"
    case sesacKey = "SesacKey"
    case refresh = "Refresh"
    case multipart = "multipart/form-data"
}
