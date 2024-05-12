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
                        icon: { Image(systemName: "home") }
                    )
                }
        }
    }
}

#Preview {
    MainTabView()
}
