//
//  Order.swift
//  HotCoffee
//
//  Created by MacBook Air on 6/6/19.
//  Copyright © 2019 Riitech. All rights reserved.
//

import Foundation

enum CoffeType: String, Codable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeSize: String, Codable {
    case small
    case medium
    case large
}


struct Order: Codable {
    
    let name: String
    let email: String
    let type: CoffeType
    let size: CoffeSize
}
