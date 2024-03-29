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
    @State private var hasLoaded = false
    
    var body: some View {
        NavigationStack {
            if !hasLoaded {
                ProgressView()
                    .onAppear{
                        libraryVM.getLibraryImages(query: "")
                        hasLoaded = true
                    }
            } else {
                ScrollViewReader{ proxyReader in
                        HStack {
                                TextField("", text: $searchText) {
                                    if searchText != "" {
                                        libraryVM.getLibraryImages(query: searchText)
                                    }
                                }
                                .modifier(PlaceholderStyle(showPlaceHolder: searchText.isEmpty, placeholder: "Search Nasa Image Library"))
                                .foregroundStyle(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(textFieldGradient)
                                        .shadow(color: .gray, radius: 5)
                                        
                                )
                                .onTapGesture {
                                    isHidePlaceholder.toggle()
                                }
                                .textFieldStyle(CustomTextField())
                                .frame(width: 350, height: 100, alignment: .center)
                                Button {
                                    searchText = ""
                                    isHidePlaceholder = true
                                } label: {
                                    if searchText != "" {
                                        Image(systemName: "x.circle.fill")
                                            .foregroundStyle(.white.opacity(0.5))
                                            .scaleEffect(1)
                                    }
                                }
                                .padding(.leading, -50)
                            }
                            .padding(.top, -20)
                            .padding(.leading, 10)
                        ScrollView(.vertical, showsIndicators: false) {
                            VMasonry(columns: 2, spacing: 10) {
                                ForEach(libraryVM.libraryImage) { image in
                                    NavigationLink(destination: Detail(image: image)) {
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
                        .background(backgroundGradient.ignoresSafeArea(.all))
                }
                .refreshable(action: {
                    
                    libraryVM.getLibraryImages(query: "")
                })
                .onAppear{UIRefreshControl.appearance().tintColor = .white}
                .background(backgroundGradient.ignoresSafeArea(.all))
                .ignoresSafeArea(.keyboard, edges: .bottom)
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
    }
}

struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                .padding(.horizontal, 15)
                .opacity(0.6)
            }
            content
            .foregroundColor(Color.white)
            .padding(5)
        }
    }
}


#Preview {
    MainViewIMG()
}
