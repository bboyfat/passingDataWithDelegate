//
//  ViewController.swift
//  TaskFiveContactsBase
//
//  Created by Andrey Petrovskiy on 3/19/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ContactsController: UITableViewController, CreateContactControllerDelegate, InfoDelegate {
    
    
    
    
    
    
    
    
    
    var contacts: [Contact] = []
    
    func didAddContact(contact: Contact) {
        
        
        contacts.append(contact)
        
        
        let newIndexPath = IndexPath(row: contacts.count - 1 , section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "TEST", style: .plain, target: self, action: #selector(addCompany))
        
        view.backgroundColor = .white
        navigationItem.title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus"), style: .plain, target: self, action: #selector(handleAddCompany))
        tableView.backgroundColor = #colorLiteral(red: 0.03529411765, green: 0.1764705882, blue: 0.2509803922, alpha: 1)
        //tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //let view = UIView()
        let header = tableView.headerView(forSection: 0)
        header?.textLabel?.text = "Name"
        header?.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = String(contact.phoneNumber)
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.detailTextLabel?.textColor = .white
        cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.6431372549, blue: 0.7137254902, alpha: 1)
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
        
        let infoVC = InfoViewController()
        let navController = UINavigationController(rootViewController: infoVC)
        
        present(navController, animated: true) {
            let path = self.contacts[indexPath.row]
            infoVC.delegate = self
            infoVC.nameLabel.text = path.name
            infoVC.phoneLabel.text = "\(path.phoneNumber)"
            infoVC.adressLabel.text = path.adress
            infoVC.cityLabel.text = path.city
        }
        
    }
    @objc func handleAddCompany(){
        print("Contact Added")
        
        let createContactController = CreateContactController()
        let navController = CustomNavigetionController(rootViewController: createContactController)
        createContactController.delegate = self
        
        present(navController, animated: true, completion: nil)
        
    }
    
    
    
    
    
}


