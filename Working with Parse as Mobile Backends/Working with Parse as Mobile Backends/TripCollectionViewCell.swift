//
//  TripCollectionViewCell.swift
//  Working with Parse as Mobile Backends
//
//  Created by MRGS on 20.07.2022.
//

import UIKit

protocol TripCollectionCellDelegate {
    func didLikeButtonPressed(cell: TripCollectionViewCell)
func didTrashButtonPressed(cell: TripCollectionViewCell)
 
}

class TripCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var totalDaysLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    var delegate: TripCollectionCellDelegate?
    
    var isLiked:Bool = false  {
        didSet {
            if isLiked {
                likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
    
    @IBAction func likeButtonTapped(sender: AnyObject) {
        delegate?.didLikeButtonPressed(cell: self)
    }
    
    @IBAction func trashButtonTapped(_ sender: UIButton) {
        delegate?.didTrashButtonPressed(cell: self)
    }
}
