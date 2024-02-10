//
//  WorldModel.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 9.02.2024.
//

import Foundation

struct WorldData: Codable {
    
    let data: [WorldModel]
}

struct WorldModel: Codable {
    
    let caption: String
    let identifier: String
    let image: String
}

