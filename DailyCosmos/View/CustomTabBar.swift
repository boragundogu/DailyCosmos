//
//  CustomTabBar.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 6.02.2024.
//

import SwiftUI


enum Tab: String, CaseIterable {
    case apod = "Home"
    case mars = "Mars"
    case images = "Images"
    
    var systemImage: String {
        switch self {
        case .apod:
            return "house"
        case .mars:
            return "globe.europe.africa"
        case .images:
            return "photo.stack"
        }
    }
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id:\.rawValue) { tab in
                    Spacer()
                    Image(systemName: tab.systemImage)
                        .scaleEffect(tab == selectedTab ? 1.0 : 0.9)
                        .foregroundStyle(selectedTab == tab ? .purple : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(height: 50)
            .background(
             Rectangle()
                .foregroundStyle(Color("tabBar-color"))
                .frame(width: 450, height: 150)
                .padding(.top, 100)
            )
        }
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.apod))
}
