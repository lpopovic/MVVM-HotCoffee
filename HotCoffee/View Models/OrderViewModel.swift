//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by MacBook Air on 6/12/19.
//  Copyright © 2019 Riitech. All rights reserved.
//

import Foundation
// view model for vc
class OrderListViewModel {
    
    var ordersViewModel: [OrderViewModel]
    
    init() {
        
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
    
}
// one order view element
struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    // properties
    
    var name: String {
        return self.order.name
    }
    
    var email: String {
        return self.order.email
    }
    
    var type: String {
        return self.order.type.rawValue.capitalized
    }
    
    var size: String {
        return self.order.size.rawValue.capitalized
    }
}
