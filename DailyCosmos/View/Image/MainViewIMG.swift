//
//  MainViewIMG.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 11.02.2024.
//

import SwiftUI
import MasonryStack

struct MainViewIMG: View {
    
    @StateObject private var libraryVM = LibraryVM()
    @State private var searchText = ""
    
    var body: some View {
        
        VStack {
            TextField("Search Image", text: $searchText) {
                libraryVM.getLibraryImages(query: searchText)
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List(libraryVM.libraryImage) { image in
                VStack {
                    Text(image.title)
                        .fontWeight(.bold)
                    AsyncImage(url: URL(string: image.imageUrl))
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
    
}

#Preview {
    MainViewIMG()
}
