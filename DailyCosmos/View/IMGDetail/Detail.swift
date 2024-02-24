//
//  Detail.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 22.02.2024.
//

import SwiftUI

struct Detail: View {
    
    let image: ImageModel
    
    var body: some View {
            NavigationStack {
                ZStack {
                    backgroundGradient.ignoresSafeArea(.all)
                    VStack {
                        
                        Text(image.title)
                            .foregroundStyle(.white)
                            .padding(.top, 15)
                            .font(.system(size: 16))
                        AsyncImage(url: URL(string: image.imageUrl)) { image in
                            image.image?.resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: .indigo, radius: 25)
                        }
                        .frame(maxWidth: 370, maxHeight: 370, alignment: .center)
                        ScrollView(showsIndicators: false){
                            if image.description != ""{
                                Text(image.description)
                                    .lineSpacing(6)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18, weight: .regular, design: .default))
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom, 15)
                            } else {
                                Text("No decription available for this image.")
                                    .foregroundStyle(.white)
                            }
                        }
                        .padding()
                    }
                    .padding()
                }
            }
    }
}

#Preview {
    Detail(image: .init(title: "Bora", imageUrl: "https://images-assets.nasa.gov/image/PIA18906/PIA18906~thumb.jpg", description: "On Sept. 10, 2017, the Hinode satellite observed an enormous X-class flare burst from an active region on the western edge of the Sun. The video shows the high-energy flare as seen by Hinode's X-Ray Telescope. The emission was so bright that the initial blast caused the detector to saturate. The giant explosion sent a huge cloud of superhot plasma zooming into interplanetary space -- a phenomenon known as a coronal mass ejection. Studying large flares like this one with a variety of instruments is key to understanding exactly what causes these dramatic eruptions, and one day predicting them before they occur."))
        .background(Color.black)
}
