//
//  ViewController.swift
//  Social Media
//
//  Created by Mac on 4/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
   public let cellTitlesArray = ["","First name","Last name","Location","Phone","Mail","Studies","Profession"]
    var userInfo : UserInformation?
    var selectionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorColor = .clear
        tableView.register(UINib(nibName: "ProfilePictureTableViewCell", bundle: nil), forCellReuseIdentifier: ProfilePictureTableViewCell.identifier)
        tableView.register(UINib(nibName: "InformationTableViewCell", bundle: nil), forCellReuseIdentifier: InformationTableViewCell.identifier)
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = UITableViewCell()
        if indexPath.row == 0 {
           let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePictureTableViewCell.identifier, for: indexPath) as! ProfilePictureTableViewCell
            cell.isUserInteractionEnabled = false
            return cell
        }
        else {
           let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
            cell.setUpInformationCell(labelName: cellTitlesArray[indexPath.row])
            cell.displayUserInformation()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 0 ? 160 : 80
    }
}
extension ViewController : UITableViewDelegate{
    
}
