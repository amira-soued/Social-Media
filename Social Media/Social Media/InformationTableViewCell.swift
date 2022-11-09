//
//  informationTableViewCell.swift
//  Social Media
//
//  Created by Mac on 6/10/2022.
//

import UIKit
//informationCellDelegate allows the ViewController to define the func informationDidChange
protocol InformationCellDelegate: AnyObject {
    func informationDidChange(value: String, type: CellType)
}

class InformationTableViewCell: UITableViewCell {
        
    @IBOutlet weak var borderStackView: UIStackView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var informationCellTextField: UITextField!
    @IBOutlet weak var textCheckImageView: UIImageView!
    
    static let identifier = "InformationTableViewCell"

    weak var delegate: InformationCellDelegate?
    var cellType: CellType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // make cell non selectable
        selectionStyle = .none
        borderStackView.layer.borderWidth = 1
        borderStackView.layer.borderColor = UIColor.lightGray.cgColor
        borderStackView.layer.cornerRadius = 15
    }
    
    func setUpInformationCell(labelName : String, value: String, type: CellType){
        self.cellType = type
        cellTitleLabel.text = labelName
        informationCellTextField.text = value
        let inputText = informationCellTextField.text ?? ""
        if inputText.isEmpty {
            textCheckImageView.isHidden = true
        }
        //check if the saved user info are valid
        switch cellType {
        case .phone(_):
            ValidPhoneNumber(informationCellTextField.text ?? "")
        case .mail(_):
            isValidEmail(informationCellTextField.text ?? "")
        default:
            isValidUserData(informationCellTextField.text ?? "")
        }
    }
    
    @IBAction func txtFieldTyping(_ sender: Any) {
        let inputText = informationCellTextField.text ?? ""
        if !inputText.isEmpty {
            textCheckImageView.isHidden = false
        } else {
            textCheckImageView.isHidden = true
        }
        guard let cellType = cellType else { return }
        switch cellType {
        case .phone(_):
            ValidPhoneNumber(informationCellTextField.text ?? "")
        case .mail(_):
            isValidEmail(informationCellTextField.text ?? "")
        default:
            isValidUserData(informationCellTextField.text ?? "")
        }
        delegate?.informationDidChange(value: inputText, type: cellType)
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

// Design Pattern :
// - objet child want to send an information to a class parent, he need to use Delegation
// - Strategy Design pattern: When you want to change implementation on excution time
// - Factory Design pattern
// - Dependency injection
