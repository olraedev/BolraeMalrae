//
//  AppRootManager.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/18/24.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .login
    @Published var temp: Temp = Temp(email: "", password: "", nickname: "")
    
    enum eAppRoots {
        case login
        case home
    }
    
    struct Temp {
        var email: String
        var password: String
        var nickname: String
    }
}
