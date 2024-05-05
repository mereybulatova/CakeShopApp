//
//  Status.swift
//  CakeShop
//
//  Created by Мерей Булатова on 04.05.2024.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    case new = "Новый"
    case cooking = "Готовится"
    case delivery = "Доставляется"
    case completed = "Выполнен"
    case cancelled = "Отменен"
}
