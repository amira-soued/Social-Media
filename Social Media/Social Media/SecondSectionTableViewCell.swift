//
//  SecondSectionTableViewCell.swift
//  Social Media
//
//  Created by Mac on 4/10/2022.
//

import UIKit

class SecondSectionTableViewCell: UITableViewCell {
    static let identifier = "SecondSectionTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .purple
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
