//
//  ViewController.swift
//  TaskFiveContactsBase
//
//  Created by Andrey Petrovskiy on 3/19/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import CoreData


class ContactsController: UITableViewController, CreateContactControllerDelegate, InfoDelegate {
   
    
    
    
    
    
    
    var contacts: [Contact] = []
    
    func didEditContact(contact: Contact) {
        let row = contacts.index(of: contact)
        let editIndexPat = IndexPath(row: row!, section: 0)
        tableView.reloadRows(at: [editIndexPat], with: .middle)
    }
    
    func didAddContact(contact: Contact) {
        
        
        contacts.append(contact)
        
        
        let newIndexPath = IndexPath(row: contacts.count - 1 , section: 0)
        tableView.insertRows(at: [newIndexPath], with: .right)
        tableView.reloadData()
    }
    
    private func fetchContact(){
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Contact>(entityName: "Contact")
        
        do{
            let contact = try context.fetch(fetchRequest)
            self.contacts = contact
            self.tableView.reloadData()
        } catch let fetchErr{
            print("FetchingError \(fetchErr)")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchContact()
        
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "TEST", style: .plain, target: self, action: #selector(addCompany))
        
        view.backgroundColor = .white
        navigationItem.title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus"), style: .plain, target: self, action: #selector(handleAddCompany))
        tableView.backgroundColor = .pie
        //tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
   override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    
    let deleteAction = UITableViewRowAction(style: .destructive, title: "DEL", handler: deleteContact)
    
       let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: editContact)
        editAction.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    
        return [deleteAction, editAction]
    }
    
    
    private func editContact(action: UITableViewRowAction, indexPath: IndexPath){
        
        let editVC = CreateContactController()
        
        let navController = CustomNavigetionController(rootViewController: editVC)
        
        editVC.contact = contacts[indexPath.row]
        
        editVC.delegate = self
     
        
        present(navController, animated: true, completion: nil)
        
    }
    private func deleteContact(action: UITableViewRowAction, indexPath: IndexPath){
        let contact = self.contacts[indexPath.row]
        self.contacts.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        let context = CoreDataManager.shared.persistentContainer.viewContext
        context.delete(contact)
        
        do{
            try context.save()
        } catch let deleteErr {
            print("Unnable to dele \(deleteErr)")
        }
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


