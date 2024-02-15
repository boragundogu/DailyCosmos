//
//  MainViewAPD.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 4.02.2024.
//

import SwiftUI

struct MainViewAPD: View {
    
    @StateObject var apodVM = APODVM()
    
    var body: some View {
        NavigationStack {
                ZStack {
                    backgroundGradient.ignoresSafeArea(.all)
                    VStack {
                        Text(apodVM.apod?.title ?? "Title")
                            .fontDesign(.monospaced)
                            .foregroundStyle(.white)
                            .padding(.top, 15)
                            .font(.system(size: 16))
                        ImageViewAPD()
                            .padding(.bottom, -10)
                        Text(apodVM.apod?.date ?? "01-01-0001")
                                .foregroundStyle(.white)
                                .fontDesign(.monospaced)
                                .font(.system(size: 16))
                        ScrollView(showsIndicators: false) {
                            Text(apodVM.apod?.explanation ?? "explanation")
                                .padding(25)
                                .lineSpacing(6)
                                .foregroundStyle(.white)
                                .font(.system(size: 17, weight: .regular, design: .default))
                                .shadow(color: Color.purple.opacity(0.8), radius: 3, x: 160, y: 110)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.top, 5)
                    }
                    .onAppear{
                        apodVM.fetchApodData()
                    }
                }
        }
    }
}

#Preview {
    MainViewAPD()
}
