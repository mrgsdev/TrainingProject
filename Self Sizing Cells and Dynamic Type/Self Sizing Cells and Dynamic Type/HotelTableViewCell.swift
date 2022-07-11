//
//  HotelTableViewCell.swift
//  Self Sizing Cells and Dynamic Type
//
//  Created by MRGS on 11.07.2022.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel:UILabel!{
        didSet {
            if let customFont = UIFont(name: "Charter Bold", size: 20) {
                let fontMetrics = UIFontMetrics(forTextStyle: .headline)
                nameLabel.font = fontMetrics.scaledFont(for: customFont)
            }
            nameLabel.adjustsFontForContentSizeCategory = true
        }
    }
    @IBOutlet weak var addressLabel:UILabel!{
        didSet{
            if let customFont = UIFont(name: "Charter Bold", size: 20) {
                let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
                addressLabel.font = fontMetrics.scaledFont(for: customFont)
            }
        }
    }
    @IBOutlet weak var descriptionLabel:UILabel!{
        didSet{
            if let customFont = UIFont(name: "Charter Bold", size: 20) {
                let fontMetrics = UIFontMetrics(forTextStyle: .body)
                descriptionLabel.font = fontMetrics.scaledFont(for: customFont)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
