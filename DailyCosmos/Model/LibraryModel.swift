//
//  LibraryModel.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 11.02.2024.
//

import Foundation


struct LibraryModel: Codable {
    
    let collection: Collection
    
    struct Collection: Codable {
        let items: [Item]
    }
    
    struct Item: Codable {
        let data: [Data]
        let links: [Link]
    }
    
    struct Data: Codable {
        let title: String
    }
    
    struct Link: Codable {
        let rel: String
        let href: String
    }
}

struct ImageModel: Identifiable {
    let id = UUID()
    let title: String
    let imageUrl: String
}
