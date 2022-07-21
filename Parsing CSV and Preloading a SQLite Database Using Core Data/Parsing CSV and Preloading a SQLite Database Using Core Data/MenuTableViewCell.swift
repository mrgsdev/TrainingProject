//
//  MenuTableViewCell.swift
//  Parsing CSV and Preloading a SQLite Database Using Core Data
//
//  Created by MRGS on 21.07.2022.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
