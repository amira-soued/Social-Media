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
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.firstName ?? ""
            )
            cell.informationCellTextField.keyboardType = configuration.keyboardType
            return cell

        case .lastName(let configuration) :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.lastName ?? ""
            )
            return cell

        case .location(let configuration) :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.location ?? ""
            )
            return cell

        case .phone(let configuration) :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.phone ?? ""
            )
            cell.informationCellTextField.keyboardType = configuration.keyboardType
            return cell

        case .mail(let configuration)  :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.mail ?? ""
            )
            cell.informationCellTextField.keyboardType = configuration.keyboardType
            return cell

        case .studies(let configuration)  :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.studies ?? ""
            )
            return cell

        case .profession(let configuration)  :
            let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.setUpInformationCell(
                labelName: configuration.title,
                value: userInformation?.profession ?? ""
            )
            return cell
        }
    }
}
