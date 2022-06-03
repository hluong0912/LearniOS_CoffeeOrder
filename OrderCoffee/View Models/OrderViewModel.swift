//
//  OrderViewModel.swift
//  OrderCoffee
//
//  Created by hl on 6/1/22.
//

import Foundation

class OrderListViewModel{
    
    var ordersViewModel: [OrderViewModel]
    
    init(){
        self.ordersViewModel = [OrderViewModel]()
    }
    
}

extension OrderListViewModel{
    
    //this willl return a model from the model list
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
    
}


struct OrderViewModel{
    let order: Order
}

//make extension to return all the attribute
extension OrderViewModel{
    
    var name:String{
        return self.order.name
    }
    
    var email:String {
        return self.order.email
    }
    
    var type: String{
        return self.order.type.rawValue.capitalized
    }
    
    var size: String{
        return self.order.type.rawValue.capitalized
    }
}
