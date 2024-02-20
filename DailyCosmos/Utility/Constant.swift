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

extension View {
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}




//MARK: - UI

var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.black, Color("bg-color"), Color("bg-color-secondary")]), startPoint: .bottomTrailing, endPoint: .topLeading)
}

var worldBackgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color("world-bg-color"), Color.black, Color.black, Color("world-bg-color")]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

var textFieldGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color("bg-color-secondary"), Color("tf-gray"), Color("bg-color-secondary")]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
