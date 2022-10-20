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
    
    public var entryText = String()
    static let identifier = "InformationTableViewCell"
    var firstName , lastName,location,mail, profession, studies : String?
    var phoneNumber : Int?
    var userInfo : UserInformation?
    let defaults = UserDefaults.standard

    override func awakeFromNib() {
        super.awakeFromNib()
        cellBorderStackView.layer.borderWidth = 1
        cellBorderStackView.layer.borderColor = UIColor.lightGray.cgColor
        cellBorderStackView.layer.cornerRadius = 15
    }
    
    func setUpInformationCell(labelName : String){
        cellTitleLabel.text = labelName
    }
    
    @IBAction func txtFieldTyping(_ sender: Any) {
        entryText = informationCellTextField.text ?? ""
        switch cellTitleLabel.text{
        case "First name":
            firstName = entryText
            defaults.set(firstName, forKey: "first name")
        case "Last name":
            lastName = entryText
            defaults.set(lastName, forKey: "last name")
        case "Location":
            location = entryText
            defaults.set(location, forKey: "location")
        case "Phone":
            phoneNumber = Int(entryText)
            defaults.set(phoneNumber, forKey: "phone")
        case "Mail":
            mail = entryText
            defaults.set(mail, forKey: "mail")
        case "Profession":
            profession = entryText
            defaults.set(profession, forKey: "profession")
        case "Studies":
            studies = entryText
            defaults.set(studies, forKey: "studies")
        default:
            return
        }
    }
    
    func displayUserInformation(){
        switch cellTitleLabel.text{
        case "First name":
            informationCellTextField.text =  defaults.string(forKey: "first name")
        case "Last name":
            informationCellTextField.text = defaults.string(forKey: "last name")
        case "Location":
            informationCellTextField.text = defaults.string(forKey: "location")
        case "Mail":
            informationCellTextField.text = defaults.string(forKey: "mail")
        case "Phone":
            informationCellTextField.text = defaults.string(forKey: "phone")
        case "Profession":
            informationCellTextField.text = defaults.string(forKey: "profession")
        case "Studies":
            informationCellTextField.text = defaults.string(forKey: "studies")
        default:
            return
        }
    }
}
