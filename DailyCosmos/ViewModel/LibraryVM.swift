//
//  LibraryVM.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 11.02.2024.
//

import Foundation


class LibraryVM: ObservableObject {
    
    @Published var libraryImage: [ImageModel] = []
    
    func getLibraryImages(query: String) {
        guard let url = URL(string: "https://images-api.nasa.gov/search?q=\(query)&media_type=image") else { return }
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            
            guard let data = data else {
                return
            }
            
            do {
                let imageResult = try JSONDecoder().decode(LibraryModel.self, from: data)
                DispatchQueue.main.async {
                    self.libraryImage = imageResult.collection.items.map { item in
                        guard let imageUrl = item.links.first?.href else {
                            return nil
                        }
                        let title = item.data.first?.title ?? "Title"
                        return ImageModel(title: title, imageUrl: imageUrl)
                    }.compactMap{ $0 }
                }
            } catch {
                print("decode error for library image fetching "  + "\(error.localizedDescription)")
            }
        }.resume()
    }
    
    
}
