//
//  MainTabview.swift
//  TrendingMovie
//
//  Created by SangRae Kim on 5/12/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            TrendView()
                .tabItem { Label(
                    title: { Text("홈") },
                    icon: { Image(systemName: "house") }
                )}
            
            FavoriteView()
                .tabItem { Label(
                    title: { Text("즐겨찾기") },
                    icon: { Image(systemName: "heart.fill") }
                )}
        }
        .toolbarBackground(.white, for: .tabBar)
        .tint(.customPrimary)
        .task {
            Task {
                await fetchMoviesGenre()
            }
        }
    }
    
    private func fetchMoviesGenre() async {
        do {
            let result = try await NetworkManager.shared.requestToAPI(model: GenreModel.self, router: TMDBRouter.genre).genres
            await MainActor.run {
                GenreManager.shared.configureGenres(result)
            }
        } catch {
            
        }
    }
}

#Preview {
    MainTabView()
}
