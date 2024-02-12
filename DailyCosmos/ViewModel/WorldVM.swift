//
//  WorldVM.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 9.02.2024.
//

import Foundation
import SwiftUI

class WorldVM: ObservableObject {
    
    @Published var worldData: [WorldModel] = []
    
    func fetchWorldData(){
        
        let calendar = Calendar.current
        guard let date = calendar.date(byAdding: .day, value: -3, to: Date()) else {
            return
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        
        
        let url = URL(string: "https://epic.gsfc.nasa.gov/api/natural/date/\(dateString)")!
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            
            guard let data = data else { return }
            
            do {
                let worldData = try JSONDecoder().decode([WorldModel].self, from: data)
                DispatchQueue.main.async {
                    self.worldData = worldData
                }
            } catch {
                print("JSON Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

