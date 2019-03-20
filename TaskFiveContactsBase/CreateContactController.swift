//
//  CreateCompanyController.swift
//  TaskFiveContactsBase
//
//  Created by Andrey Petrovskiy on 3/19/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol CreateContactControllerDelegate{
    func didAddContact(contact: Contact)
}


class CreateContactController: UIViewController{
    
    
    var delegate: CreateContactControllerDelegate?
    
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        
        //enable autolayout
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let nameTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.placeholder = "Type Name"
        return textField
    }()
    
    
    let phoneNumber: UILabel = {
        let phone = UILabel()
        phone.text = "Phone"
        phone.translatesAutoresizingMaskIntoConstraints = false
        
        return phone
    }()
    let phoneTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Type Name"
        return textField
    }()
    
    let cityLabel: UILabel = {
        let phone = UILabel()
        phone.text = "City"
        phone.translatesAutoresizingMaskIntoConstraints = false
        
        return phone
    }()
    let cityTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Type City"
        return textField
    }()
    
    let adressLabel: UILabel = {
        let phone = UILabel()
        phone.text = "Adress"
        phone.translatesAutoresizingMaskIntoConstraints = false
        
        return phone
    }()
    let adressTF:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Adress"
        return textField
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Create Contact"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        
        view.backgroundColor = #colorLiteral(red: 0.03529411765, green: 0.1764705882, blue: 0.2509803922, alpha: 1)
        
        setupUI()
        
    }
    
    private func setupUI(){
        let lightBlueBackgroundView = UIView()
        lightBlueBackgroundView.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        lightBlueBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBlueBackgroundView)
        lightBlueBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBlueBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBlueBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBlueBackgroundView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameTextField)
        
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        
        
        view.addSubview(phoneNumber)
        phoneNumber.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        phoneNumber.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        phoneNumber.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        phoneNumber.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(phoneTextField)
        
        phoneTextField.leftAnchor.constraint(equalTo: phoneNumber.rightAnchor).isActive = true
        phoneTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        phoneTextField.bottomAnchor.constraint(equalTo: phoneNumber.bottomAnchor).isActive = true
        phoneTextField.topAnchor.constraint(equalTo: phoneNumber.topAnchor).isActive = true
        
        view.addSubview(cityLabel)
        cityLabel.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor).isActive = true
        cityLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        cityLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        cityLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(cityTextField)
        
        cityTextField.leftAnchor.constraint(equalTo: cityLabel.rightAnchor).isActive = true
        cityTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        cityTextField.bottomAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
        cityTextField.topAnchor.constraint(equalTo: cityLabel.topAnchor).isActive = true
        
        view.addSubview(adressLabel)
        adressLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
        adressLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        adressLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        adressLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(adressTF)
        
        adressTF.leftAnchor.constraint(equalTo: adressLabel.rightAnchor).isActive = true
        adressTF.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        adressTF.bottomAnchor.constraint(equalTo: adressLabel.bottomAnchor).isActive = true
        adressTF.topAnchor.constraint(equalTo: adressLabel.topAnchor).isActive = true
        
        
        
        
    }
    
    
    @objc private func handleSave(){
        print("trying to save contact")
        
        guard let name = self.nameTextField.text else { return }
        guard let phone = Int(self.phoneTextField.text!) else { return }
        guard let city = self.cityTextField.text else {return}
        guard let adress = self.adressTF.text else {return}
        
        dismiss(animated: true) {
            
            let contact = Contact(name: name, phoneNumber: phone, city: city, adress: adress)
            print(contact)
            self.delegate?.didAddContact(contact: contact)
        }
        
    }
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
