//
//  ViewController.swift
//  Social Media
//
//  Created by Mac on 4/10/2022.
//

import UIKit

struct InformationCellConfiguration {
    let title: String
    var keyboardType: UIKeyboardType = .default
}

enum CellType {
    case header
    case firstName(InformationCellConfiguration)
    case lastName(InformationCellConfiguration)
    case location(InformationCellConfiguration)
    case phone(InformationCellConfiguration)
    case mail(InformationCellConfiguration)
    case studies(InformationCellConfiguration)
    case profession(InformationCellConfiguration)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!

    public let cells: [CellType] = [
        .header,
        .firstName(InformationCellConfiguration(title: "First name")),
        .lastName(InformationCellConfiguration(title: "Last name")),
        .mail(InformationCellConfiguration(title: "Mail", keyboardType: .emailAddress )),
        .profession(InformationCellConfiguration(title: "Profession")),
        .phone(InformationCellConfiguration(title: "Phone", keyboardType: .phonePad)),
        .location(InformationCellConfiguration(title: "Location")),
        .studies(InformationCellConfiguration(title: "Studies"))
    ]
    
    var selectionNumber = 0
    var userInformation: UserInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorColor = .clear
        tableView.register(UINib(nibName: "ProfilePictureTableViewCell", bundle: nil), forCellReuseIdentifier: ProfilePictureTableViewCell.identifier)
        tableView.register(UINib(nibName: "InformationTableViewCell", bundle: nil), forCellReuseIdentifier: InformationTableViewCell.identifier)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 300, right: 0)
        tableView.keyboardDismissMode = .interactive
        
        let userDefault = UserDefaults.standard
        userInformation = UserInformation(
            firstName: userDefault.string(forKey: "First name") ?? "",
            lastName: userDefault.string(forKey: "Last name") ?? "",
            location: userDefault.string(forKey: "Location") ?? "",
            phone: userDefault.string(forKey: "Phone") ?? "" ,
            profession: userDefault.string(forKey: "Profession") ?? "",
            studies: userDefault.string(forKey: "Studies") ?? "",
            mail: userDefault.string(forKey: "Mail") ?? ""
        )
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        // Save userInformation
        let userDefault = UserDefaults.standard
        userDefault.set(userInformation?.firstName, forKey: "First name")
        userDefault.set(userInformation?.lastName, forKey: "Last name")
        userDefault.set(userInformation?.location, forKey: "Location")
        userDefault.set(userInformation?.phone, forKey: "Phone")
        userDefault.set(userInformation?.profession, forKey: "Profession")
        userDefault.set(userInformation?.studies, forKey: "Studies")
        userDefault.set(userInformation?.mail, forKey: "Mail")
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cells[indexPath.row]
        switch cellType {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePictureTableViewCell.identifier, for: indexPath) as! ProfilePictureTableViewCell
            return cell
        case .firstName(let configuration):
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.delegate = self
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.firstName ?? "",
                type: cellType
            )
            cell.informationCellTextField.keyboardType = configuration.keyboardType
            return cell

        case .lastName(let configuration) :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.delegate = self
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.lastName ?? "",
                type: cellType
            )
            return cell

        case .location(let configuration) :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.delegate = self
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.location ?? "",
                type: cellType
            )
            return cell

        case .phone(let configuration) :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.delegate = self
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.phone ?? "",
                type: cellType
            )
            cell.informationCellTextField.keyboardType = configuration.keyboardType
            return cell

        case .mail(let configuration)  :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.delegate = self
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.mail ?? "",
                type: cellType
            )
            cell.informationCellTextField.keyboardType = configuration.keyboardType
            return cell

        case .studies(let configuration)  :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.delegate = self
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.studies ?? "",
                type: cellType
            )
            return cell

        case .profession(let configuration)  :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.delegate = self
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.profession ?? "",
                type: cellType
            )
            return cell
        }
    }
}

extension ViewController: InformationCellDelegate {
// store the text typed by the user inside the userInformation according to the cellType
    func informationDidChange(value: String, type: CellType) {
        switch type {
        case .header:
            break
        case .firstName:
            userInformation?.firstName = value
            
        case .lastName:
            userInformation?.lastName = value

        case .location:
            userInformation?.location = value

        case .phone:
            userInformation?.phone = value

        case .mail:
            userInformation?.mail = value

        case .studies:
            userInformation?.studies = value

        case .profession:
            userInformation?.profession = value
        }
    }
}
