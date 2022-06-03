//
//  Order.swift
//  OrderCoffee
//
//  Created by hl on 6/1/22.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable{
    case capuchino
    case latte
    case espresso
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable{
    case small
    case medium
    case large
    
}

struct Order: Codable{
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
