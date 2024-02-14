//
//  Constant.swift
//  DailyCosmos
//
//  Created by Bora Gündoğu on 4.02.2024.
//

import SwiftUI


//MARK: - Extensions

extension MainViewIMG {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


//MARK: - UI

var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.black, Color("bg-color"), Color("bg-color-secondary")]), startPoint: .bottomTrailing, endPoint: .topLeading)
}

var worldBackgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color("world-bg-color"), Color.black, Color.black, Color("world-bg-color")]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
