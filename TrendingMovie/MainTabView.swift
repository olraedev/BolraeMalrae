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
                .tabItem {
                    Label(
                        title: { Text("Trending") },
                        icon: { Image(systemName: "house") }
                    )
                }
            
            FavoriteView()
                .tabItem { Label(
                    title: { Text("Favorite") },
                    icon: { Image(systemName: "heart") }
                ) }
        }
        .toolbarBackground(.white, for: .tabBar)
        .tint(.customPrimary)
    }
}

#Preview {
    MainTabView()
}
