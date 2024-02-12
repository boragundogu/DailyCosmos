//
//  ContentView.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 4.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activeTab: Tab = .apod
    @State var isShowTabView = true
    
    init() {
      UITabBar.appearance().isHidden = true // custom TabBar görünümünü gizlemek için.
    }
    var body: some View {
    
        ZStack {
            Color("tabBar-color")
            VStack {
                if isShowTabView {
                    TabView(selection: $activeTab) {
                        MainViewAPD()
                            .tag(Tab.apod)
                        MainViewWRD()
                            .tag(Tab.mars)
                        MainViewIMG()
                            .tag(Tab.images)
                    }
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
