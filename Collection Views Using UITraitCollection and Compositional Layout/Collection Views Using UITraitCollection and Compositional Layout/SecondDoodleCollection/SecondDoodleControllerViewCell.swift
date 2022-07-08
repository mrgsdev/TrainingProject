//
//  DoodleControllerCell.swift
//  Collection Views Using UITraitCollection and Compositional Layout
//
//  Created by MRGS on 08.07.2022.
//

import UIKit

class SecondDoodleControllerViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!{
        didSet {
               imageView.layer.cornerRadius = 20.0
               imageView.clipsToBounds = true
           }
    }
}
