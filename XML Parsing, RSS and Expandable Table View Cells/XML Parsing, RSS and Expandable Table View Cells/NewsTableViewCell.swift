//
//  NewsTableViewCell.swift
//  XML Parsing, RSS and Expandable Table View Cells
//
//  Created by MRGS on 13.07.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel:UILabel! {
        didSet {
            titleLabel.numberOfLines = 0
            titleLabel.font = .rounded(size: 22, weight: .bold)
        }
    }
    @IBOutlet weak var descriptionLabel:UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var dateLabel:UILabel! {
        didSet {
            dateLabel.numberOfLines = 0
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
