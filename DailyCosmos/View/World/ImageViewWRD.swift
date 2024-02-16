//
//  ImageViewWRD.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 9.02.2024.
//

import SwiftUI

struct ImageViewWRD: View {
    
    @StateObject var worldVM = WorldVM()
    
    var body: some View {
        
        let date = Date()
        let calendar = Calendar.current
        let year = String(calendar.component(.year, from: date))
        let month = String("0" + "\(calendar.component(.month, from: date))")
        let day = calendar.component(.day, from: date) - 2
        let dayString = day < 10 ? String("0\(day)") : String("\(day)")
        
    

        
        ZStack {
            worldBackgroundGradient.ignoresSafeArea(.all)
            VStack {
                ForEach(worldVM.worldData.prefix(1), id:\.identifier) { world in
                    Text("How does our world look today?")
                        .foregroundStyle(.white)
                        .padding(10)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .lineLimit(1)
                    let url = URL(string: "https://api.nasa.gov/EPIC/archive/natural/\(year)/\(month)/\(dayString)/png/\(world.image).png?api_key=bOhEcC52NS85ixdpdrhKKhcquknyRTeAaoKgXplz")
                    AsyncImage(url: url) { image in
                        image.image?
                            .resizable()
                            .scaledToFit()
                            .clipShape(
                                Circle()
                            )
                            .frame(width: 350, height: 350, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(contentMode: .fit)
                    Text(world.caption)
                        .foregroundStyle(.white)
                        .padding(.top, 10)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                }
                
            }
            .onAppear{
                worldVM.fetchWorldData()
        }
        }
    }

}

#Preview {
    ImageViewWRD()
}
