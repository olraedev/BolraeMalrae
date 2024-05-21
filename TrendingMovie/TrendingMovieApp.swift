//
//  TrendingMovieApp.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/9/24.
//

import SwiftUI

@main
struct TrendingMovieApp: App {
    
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .login:
                    LoginView()
                case .home:
                    MainTabView()
                }
            }
            .environmentObject(appRootManager)
            .onAppear {
                selectFirstView()
            }
        }
    }
    
    private func selectFirstView() {
        if UserDefaultsManager.accessToken.isEmpty {
            appRootManager.currentRoot = .login
        } else {
            appRootManager.currentRoot = .home
        }
    }
}
