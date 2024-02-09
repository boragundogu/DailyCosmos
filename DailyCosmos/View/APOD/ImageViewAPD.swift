//
//  ImageViewAPD.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 4.02.2024.
//

import SwiftUI

struct ImageViewAPD: View {
    
    @StateObject var apodVM = APODVM()
    
    
    var body: some View {
        VStack {
                AsyncImage(url: URL(string: apodVM.apod?.hdurl ?? "apod")) { image in
                    image.image?.resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .gray, radius: 30)
                }
                .frame(width: 350, height: 350, alignment: .center)
        }
        .padding()
        .onAppear{
            apodVM.fetchApodData()
        }
    }
}

#Preview {
    ImageViewAPD()
        .padding()
        .background(Color.black)
}
