//
//  ContentView.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 4.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activeTab: Tab = .apod
    
    init() {
      UITabBar.appearance().isHidden = true // custom TabBar görünümünü gizlemek için.
    }
    var body: some View {
    
        ZStack {
            Color("tabBar-color")
            VStack {
                TabView(selection: $activeTab) {
                    MainViewAPD()
                        .tag(Tab.apod)
                }
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $activeTab)
            }
        }
        
    }

}

#Preview {
    ContentView()
}
