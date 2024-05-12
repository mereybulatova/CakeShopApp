//
//  DiscountDetailViewModel.swift
//  CakeShop
//
//  Created by Мерей Булатова on 08.05.2024.
//

import Foundation
import UIKit

class DiscountDetailViewModel: ObservableObject {
    @Published var discount: Discount
    @Published var image = UIImage(named: "discount")!
    @Published var selectedDiscount: Discount?
    
    init(discount: Discount) {
        self.discount = discount
    }
    
//    func getImage() {
//        StorageService.shared.downloadProductImage(id: discount.id, category: <#String#>) { result in
//            switch result {
//            case .success(let data):
//                if let image = UIImage(data: data) {
//                    self.image = image
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
}
