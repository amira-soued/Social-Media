//
//  informationTableViewCell.swift
//  Social Media
//
//  Created by Mac on 6/10/2022.
//

import UIKit

class InformationTableViewCell: UITableViewCell {
        
    @IBOutlet weak var cellBorderStackView: UIStackView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var informationCellTextField: UITextField!
    public var cellTitleText = String()
    static let identifier = "InformationTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBorderStackView.layer.borderWidth = 1
        cellBorderStackView.layer.borderColor = UIColor.lightGray.cgColor
        cellBorderStackView.layer.cornerRadius = 15
        cellTitleLabel.text = cellTitleText
    }
    
    func setUpInformationCell(labelName : String){
        cellTitleLabel.text = labelName
    }
}
