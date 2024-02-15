//
//  MainViewIMG.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 11.02.2024.
//

import SwiftUI
import SwiftUIMasonry

struct MainViewIMG: View {
    
    @StateObject private var libraryVM = LibraryVM()
    @State private var searchText = ""
    let gridItemLayout = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VMasonry(columns: 2, spacing: 10) {
                    ForEach(libraryVM.libraryImage) { image in
                            AsyncImage(url: URL(string: image.imageUrl)) { img in
                                switch img {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipped()
                                        .cornerRadius(10)
                                        .shadow(color: .gray, radius: 5)
                                case .failure:
                                    Text("Failed to load image")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        .padding(5)
                    }
                }
            }
            .background(backgroundGradient.ignoresSafeArea(.all))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    TextField("Search", text: $searchText) { _ in
                        libraryVM.getLibraryImages(query: searchText)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .toolbarBackground(.hidden)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}


    
    #Preview {
        MainViewIMG()
    }
