//
//  informationTableViewCell.swift
//  Social Media
//
//  Created by Mac on 6/10/2022.
//

import UIKit

class InformationTableViewCell: UITableViewCell {
        
    @IBOutlet weak var borderStackView: UIStackView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var informationCellTextField: UITextField!
    @IBOutlet weak var textCheckImageView: UIImageView!
    
    static let identifier = "InformationTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        borderStackView.layer.borderWidth = 1
        borderStackView.layer.borderColor = UIColor.lightGray.cgColor
        borderStackView.layer.cornerRadius = 15
    }
    
    func setUpInformationCell(labelName : String, value: String){
        cellTitleLabel.text = labelName
        informationCellTextField.text = value
        isValidUsername(informationCellTextField.text ?? "")
    }
    
    @IBAction func txtFieldTyping(_ sender: Any) {
        let entryText = informationCellTextField.text ?? ""
        guard entryText.isEmpty != true else { textCheckImageView.isHidden = true
            return
        }
        textCheckImageView.isHidden = false
        isValidUsername(informationCellTextField.text ?? "")
    }
        
    @discardableResult
    func isValidUsername(_ name: String , forbiddenChars: String = "@#$%&*(){}[]`£^<>!?;:/.=-+°§'") -> Bool {
        guard  name.first!.isLetter else { return false }
        let isValid = name.allSatisfy{ !forbiddenChars.contains($0) }
        
        textCheckImageView.image = .init(systemName: isValid ? "checkmark" : "multiply")
        textCheckImageView.image = textCheckImageView.image?.withRenderingMode(.alwaysTemplate)
        textCheckImageView.tintColor = isValid ? UIColor.green : .red
        
        return isValid
    }
}
