//
//  TimeWindow.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import Foundation

enum TimeWindow: String, CaseIterable {
    case day
    case week
    
    var title: String {
        switch self {
        case .day: "일간"
        case .week: "주간"
        }
    }
}
