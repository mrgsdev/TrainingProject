//
//  UIFont_Ext.swift
//  XML Parsing, RSS and Expandable Table View Cells
//
//  Created by MRGS on 13.07.2022.
//

import UIKit

extension UIFont {
    class func rounded(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: size)
        } else {
            font = systemFont
        }
        return font
    }
}
