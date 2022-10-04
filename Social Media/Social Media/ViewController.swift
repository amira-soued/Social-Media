//
//  ViewController.swift
//  Social Media
//
//  Created by Mac on 4/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 0
        tableView.register(UINib(nibName: "FirstSectionTableViewCell", bundle: nil), forCellReuseIdentifier: FirstSectionTableViewCell.identifier)
        tableView.register(UINib(nibName: "SecondSectionTableViewCell", bundle: nil), forCellReuseIdentifier: SecondSectionTableViewCell.identifier)
    }


}
extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var sectionNumber = 0
        if section == 0 {
            sectionNumber = 1
        }
        if section == 1 {
            sectionNumber = 7
        }
        return sectionNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: FirstSectionTableViewCell.identifier, for: indexPath)
        }
        if indexPath.section == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: SecondSectionTableViewCell.identifier, for: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 1 ? "PUBLIC INFORMATION" : ""
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? 120 : 80
    }
    
    
}
extension ViewController : UITableViewDelegate{
    
}
