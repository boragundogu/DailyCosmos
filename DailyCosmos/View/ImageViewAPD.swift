//
//  ImageViewAPD.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 4.02.2024.
//

import SwiftUI

struct ImageViewAPD: View {
    var body: some View {
        Image("apod")
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .gray, radius: 30, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        //.clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 60, topTrailing: 60)))
    }
}

#Preview {
    ImageViewAPD()
        .padding()
        .background(Color.black)
}
