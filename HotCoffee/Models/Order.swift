//
//  Order.swift
//  HotCoffee
//
//  Created by MacBook Air on 6/6/19.
//  Copyright © 2019 Riitech. All rights reserved.
//

import Foundation

enum CoffeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeSize: String, Codable, CaseIterable {
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

extension Order {
    
    static var all: Resource<[Order]> = {
        guard  let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL is incorrect!")
        }
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddCoffeOrderViewModel) -> Resource<Order?> {
        let order = Order(vm)
        guard  let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL is incorrect!")
        }
       guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = .post
        resource.body = data
        
        return resource
        
    }
}

extension Order {
    init?(_ vm: AddCoffeOrderViewModel) {
        guard let name = vm.name, let email = vm.email, let seletedType = CoffeType(rawValue: vm.selectedType!.lowercased()), let selectedSize = CoffeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        
        self.name = name
        self.email = email
        self.size = selectedSize
        self.type = seletedType
        
    }
}
