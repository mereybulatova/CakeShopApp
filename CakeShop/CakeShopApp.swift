//
//  CakeShopApp.swift
//  CakeShop
//
//  Created by Мерей Булатова on 30.04.2024.
//

import SwiftUI

let screen = UIScreen.main.bounds

@main
struct CakeShopApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
