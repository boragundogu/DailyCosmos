//
//  ContentView.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 4.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainViewAPD()
                .tabItem {
                    Label("APOD", systemImage: "list.dash")
                }
            ImageViewAPD()
                .tabItem {
                    Label("Mars", systemImage: "mic.fill")
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    ContentView()
}
