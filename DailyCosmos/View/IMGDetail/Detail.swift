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
            VStack {
                Text(image.title)
                    .padding()
                AsyncImage(url: URL(string: image.imageUrl)) { image in
                    switch image {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .gray, radius: 15)
                            .frame(width: 350, height: 150, alignment: .center)
                    case .failure:
                        Text("Error to load images")
                    @unknown default:
                        EmptyView()
                    }
                }

            }
        }
    }
}

#Preview {
    Detail(image: .init(title: "Bora", imageUrl: "https://images-assets.nasa.gov/image/PIA18906/PIA18906~thumb.jpg"))
        .background(Color.gray)
}
