//
//  MainViewWRD.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 9.02.2024.
//

import SwiftUI

struct MainViewWRD: View {
    
    @StateObject var worldVM = WorldVM()
    
    
    var body: some View {
        ZStack {
            ImageViewWRD()
        }
    }
}

#Preview {
    MainViewWRD()
}
