//
//  Structs.swift
//  HW13 Auto Layout Engine
//
//  Created by telkanishvili on 08.04.24.
//

import Foundation

struct Coffe {
    let productName: String
    var reviewCount: Int
    var smallCoffeePrice: Double
    var mediumCoffeePrice: Double {
        smallCoffeePrice + 1.14
    }
    var bigCoffeePrice: Double {
        smallCoffeePrice + 3.25
    }
}
