//
//  MainViewAPD.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 4.02.2024.
//

import SwiftUI

struct MainViewAPD: View {
    var body: some View {
        NavigationStack {
                ZStack {
                    backgroundGradient.ignoresSafeArea(.all)
                    VStack {
                        Text("The Cone Nebula from Hubble")
                            .fontDesign(.monospaced)
                            .foregroundStyle(.white)
                        ImageViewAPD()
                            .padding()
                            Text("2024-02-04")
                                .foregroundStyle(.white)
                                .fontDesign(.monospaced)
                                .padding(.bottom, 20)
                        Text("Stars are forming in the gigantic dust pillar called the Cone Nebula. Cones, pillars, and majestic flowing shapes abound in stellar nurseries where natal clouds of gas and dust are buffeted by energetic winds from newborn stars. The Cone Nebula, a well-known example, lies within the bright galactic star-forming region NGC 2264. The Cone was captured in unprecedented detail in this close-up composite of several observations from the Earth-orbiting Hubble Space Telescope.")
                            .padding(25)
                            .lineSpacing(6)
                            .foregroundStyle(.white)
                            .font(.system(size: 18, weight: .regular, design: .default))
                            .shadow(color: Color.purple.opacity(0.8), radius: 3, x: 160, y: 110)
                    }
                }
        }
    }
}

#Preview {
    MainViewAPD()
}
