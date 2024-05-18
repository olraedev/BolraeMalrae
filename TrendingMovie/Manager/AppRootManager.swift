//
//  AppRootManager.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/18/24.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .login
    
    enum eAppRoots {
        case login
        case home
    }
}
