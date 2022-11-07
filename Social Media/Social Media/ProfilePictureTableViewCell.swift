//
//  FirstSectionTableViewCell.swift
//  Social Media
//
//  Created by Mac on 4/10/2022.
//

import UIKit

class ProfilePictureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageFrameStackView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var cameraIconImageView: UIImageView!
    static let identifier = "ProfilePictureTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        imageFrameStackView.layer.borderWidth = 1
        imageFrameStackView.layer.borderColor = UIColor.brown.cgColor
        imageFrameStackView.layer.cornerRadius = 42
        contentView.sendSubviewToBack(imageFrameStackView)
        cameraIconImageView.layer.borderWidth = 0.5
        cameraIconImageView.layer.borderColor = UIColor.lightGray.cgColor
        cameraIconImageView.layer.cornerRadius = 14
        profileImageView.layer.cornerRadius = 41
        
    }
    
}

