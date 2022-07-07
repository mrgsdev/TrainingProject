//
//  ExtSnap.swift
//  Grid Layouts Using Collection Views and Diffable Data Source
//
//  Created by MRGS on 07.07.2022.
//


import UIKit
extension UIView {
    var snapshot: UIImage? {
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}
