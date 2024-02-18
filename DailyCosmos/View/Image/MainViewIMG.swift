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
    
    @State private var scrollViewOffset: CGFloat = 0
    @State private var startOffset: CGFloat = 0
    @State private var isScrollToTop = false   
    @State private var isHidePlaceholder = true
    
    var body: some View {
        NavigationStack {
            ScrollViewReader{ proxyReader in
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
                    .padding(.bottom, 50)
                    .id("GO_TO_TOP")
                    .overlay(
                        GeometryReader{ proxy -> Color in
                            DispatchQueue.main.async{
                                if startOffset == 0 {
                                    self.startOffset = proxy.frame(in: .global).minY
                                }
                                let offset = proxy.frame(in: .global).minY
                                self.scrollViewOffset = offset - startOffset
                            }
                            return Color.clear
                        }
                            .frame(width: 0, height: 0, alignment: .top)
                    )
                }
                .overlay(
                    Button(action: {
                        withAnimation(Animation.linear(duration: 0.3)) {
                            isScrollToTop = true
                            proxyReader.scrollTo("GO_TO_TOP", anchor: .top)
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isScrollToTop = false
                        }
                    }, label: {
                        Image(systemName: "arrow.up")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.red)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.09), radius: 5, x: 5, y: 5)
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.trailing)
                    .padding(.bottom,getSafeArea().bottom == 0 ? 12 : 0)
                    .padding(.bottom, 100)
                    .opacity(-scrollViewOffset > 100 ? 1 : 0)
                    .disabled(isScrollToTop)
                    ,alignment: .bottomTrailing
                    
                )
                .padding()
                .onAppear{
                    libraryVM.getLibraryImages(query: "")
                }
                .background(backgroundGradient.ignoresSafeArea(.all))
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                            HStack {
                                TextField("Explore Nasa Image Library", text: $searchText) {
                                    if searchText != "" {
                                        libraryVM.getLibraryImages(query: searchText)
                                    }
                                }
                                .onTapGesture {
                                    isHidePlaceholder.toggle()
                                }
                                .textFieldStyle(CustomTextField())
                                .frame(width: 350, height: 100, alignment: .center)
                                .foregroundStyle(.white)
                                Button {
                                    searchText = ""
                                    isHidePlaceholder = true
                                } label: {
                                    if searchText != "" {
                                        Image(systemName: "x.circle.fill")
                                            .foregroundStyle(.black.opacity(0.5))
                                            .scaleEffect(0.85)
                                    }
                                }
                                .padding(.leading, -50)
                            }
                            .padding(.top, 20)
                            .padding(.leading, 10)
                        .padding(.bottom, 15)
                    }
                }
                .toolbarBackground(backgroundGradient.opacity(0.9))
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}



struct CustomTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(textFieldGradient.ignoresSafeArea())
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .gray, radius: 10)
    }
}


#Preview {
    MainViewIMG()
}
