//
//  Icon.swift
//  Grid Layouts Using Collection Views and Diffable Data Source
//
//  Created by MRGS on 07.07.2022.
//

import Foundation
struct Icon:Hashable {
    var name: String = ""
    var price: Double = 0.0
    var isFeatured: Bool = false
    init(name: String, price: Double, isFeatured: Bool) {
        self.name = name
        self.price = price
        self.isFeatured = isFeatured
    }
    
}
