//
//  ContentView.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 4.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activeTab: Tab = .apod
    @StateObject private var libraryVM = LibraryVM()
    @State  var isShowTabView = true
    
    init() {
        UITabBar.appearance().isHidden = true // custom TabBar görünümünü gizlemek için.
    }
    
    var body: some View {
        ZStack {
            Color("tabBar-color")
                VStack {
                    if isShowTabView {
                        NavigationStack {
                            TabView(selection: $activeTab) {
                                    MainViewAPD()
                                        .tag(Tab.apod)
                                    MainViewWRD()
                                        .tag(Tab.mars)
                                    MainViewIMG()
                                        .tag(Tab.images)
                            }
                        }
                        .toolbar(.hidden)
                    }
                    else {
                        EmptyView()
                    }
                }
            VStack {
                Spacer()
                    CustomTabBar(selectedTab: $activeTab)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
#Preview {
    ContentView()
}
