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
    case feedback = "Feedback"
    
    var systemImage: String {
        switch self {
        case .apod:
            return "house"
        case .mars:
            return "moon.circle"
        case .images:
            return "photo.artframe"
        case .feedback:
            return "info.circle.fill"
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
