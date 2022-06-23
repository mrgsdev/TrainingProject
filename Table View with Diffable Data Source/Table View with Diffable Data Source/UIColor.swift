//
//  UIColor.swift
//  Table View with Diffable Data Source
//
//  Created by MRGS on 23.06.2022.
//

import Foundation
import UIKit

extension UIColor{
    convenience init(red: Int, green: Int, blue: Int) {
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
    }
     
}
