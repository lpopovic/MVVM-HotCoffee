//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by MacBook Air on 6/12/19.
//  Copyright © 2019 Riitech. All rights reserved.
//

import Foundation

struct AddCoffeOrderViewModel {
    var name: String?
    var email: String?
    
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
       return CoffeType.allCases.map{$0.rawValue.capitalized}
    }
    
    var sizes: [String] {
         return CoffeSize.allCases.map{$0.rawValue.capitalized}
    }
}
