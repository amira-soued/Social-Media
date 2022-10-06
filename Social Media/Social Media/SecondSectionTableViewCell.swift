//
//  SecondSectionTableViewCell.swift
//  Social Media
//
//  Created by Mac on 4/10/2022.
//

import UIKit

class SecondSectionTableViewCell: UITableViewCell {
        
    @IBOutlet weak var cellBorderStackView: UIStackView!
    
    static let identifier = "SecondSectionTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBorderStackView.layer.borderWidth = 1
        cellBorderStackView.layer.borderColor = UIColor.lightGray.cgColor
        
        cellBorderStackView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
