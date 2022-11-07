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
        // make cell non selectable
        selectionStyle = .none
        borderStackView.layer.borderWidth = 1
        borderStackView.layer.borderColor = UIColor.lightGray.cgColor
        borderStackView.layer.cornerRadius = 15
    }
    
    func setUpInformationCell(labelName : String, value: String){
        cellTitleLabel.text = labelName
        informationCellTextField.text = value
        let entryText = informationCellTextField.text ?? ""
        if entryText.isEmpty {
            textCheckImageView.isHidden = true
        }
        isValidUserData(informationCellTextField.text ?? "")
    }
    
    func saveInformation(input : String){
        let key = cellTitleLabel.text ?? ""
        let defaults = UserDefaults.standard
        defaults.set(input, forKey: key)
    }
    
    @IBAction func txtFieldTyping(_ sender: Any) {
        let entryText = informationCellTextField.text ?? ""
        if !entryText.isEmpty {
            textCheckImageView.isHidden = false
        } else {
            textCheckImageView.isHidden = true
        }
        saveInformation(input: entryText)
        isValidUserData(informationCellTextField.text ?? "")
        if cellTitleLabel.text == "Mail" {
            isValidEmail(informationCellTextField.text ?? "")
        }
        if cellTitleLabel.text == "Phone" {
            ValidPhoneNumber(informationCellTextField.text ?? "")
        }
    }
        
    @discardableResult
    func isValidUserData(_ name: String , forbiddenChars: String = "„¿•±¡@#€¥$‰&%*(){}[]`£^<>!?;:/.=-+°§'’±”") -> Bool {
        let isValid = name.allSatisfy{ !forbiddenChars.contains($0) }
        textCheckImageView.image = .init(systemName: isValid ? "checkmark" : "multiply")
        textCheckImageView.image = textCheckImageView.image?.withRenderingMode(.alwaysTemplate)
        textCheckImageView.tintColor = isValid ? UIColor.green : .red
        return isValid
    }
    
    @discardableResult
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValid = emailPred.evaluate(with: email)
        textCheckImageView.image = .init(systemName: isValid ? "checkmark" : "multiply")
        textCheckImageView.image = textCheckImageView.image?.withRenderingMode(.alwaysTemplate)
        textCheckImageView.tintColor = isValid ? UIColor.green : .red
        return isValid
    }
    
    @discardableResult
    func ValidPhoneNumber(_ value: String) -> Bool {
        let phoneRegEx = "[0-9+#*]{6,14}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        let isValid = phoneTest.evaluate(with: value)
        textCheckImageView.image = .init(systemName: isValid ? "checkmark" : "multiply")
        textCheckImageView.image = textCheckImageView.image?.withRenderingMode(.alwaysTemplate)
        textCheckImageView.tintColor = isValid ? UIColor.green : .red
        return isValid
    }
}
