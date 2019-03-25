//
//  InfoViewController.swift
//  TaskFiveContactsBase
//
//  Created by Andrey Petrovskiy on 3/20/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
protocol InfoDelegate {
    
}

class InfoViewController: UIViewController{
    
    var delegate: InfoDelegate?
    
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "System", size: 20)
        label.textColor = .black
        label.textAlignment  = .center
        label.backgroundColor = #colorLiteral(red: 0.5298276544, green: 1, blue: 0.9998101592, alpha: 1)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "System", size: 20)
        label.textColor = .black
        label.textAlignment  = .center
         label.backgroundColor = #colorLiteral(red: 0.5298276544, green: 1, blue: 0.9998101592, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "System", size: 20)
        label.textAlignment  = .center
        label.textColor = .black
         label.backgroundColor = #colorLiteral(red: 0.5298276544, green: 1, blue: 0.9998101592, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let adressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "System", size: 20)
        label.textAlignment  = .center
        label.textColor = .black
         label.backgroundColor = #colorLiteral(red: 0.5298276544, green: 1, blue: 0.9998101592, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        navigationItem.title = "Info Controller"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(handleOk))
        addUIElement()
    }
    
    @objc func handleOk(){
        dismiss(animated: true, completion: nil)
    }
    
    func addUIElement(){
        
        let lightBlueBackgroundView = UIView()
        lightBlueBackgroundView.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        lightBlueBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBlueBackgroundView)
        lightBlueBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBlueBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBlueBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBlueBackgroundView.heightAnchor.constraint(equalToConstant: 400)
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view!.topAnchor).isActive = true
         nameLabel.leftAnchor.constraint(equalTo: view!.leftAnchor).isActive = true
         nameLabel.rightAnchor.constraint(equalTo: view!.rightAnchor).isActive = true
         nameLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 40).isActive = true
        view.addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        phoneLabel.leftAnchor.constraint(equalTo: view!.leftAnchor).isActive = true
        phoneLabel.rightAnchor.constraint(equalTo: view!.rightAnchor).isActive = true
        phoneLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 40).isActive = true
        view.addSubview(cityLabel)
        cityLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor).isActive = true
        cityLabel.leftAnchor.constraint(equalTo: view!.leftAnchor).isActive = true
        cityLabel.rightAnchor.constraint(equalTo: view!.rightAnchor).isActive = true
        cityLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 40).isActive = true
        view.addSubview(adressLabel)
        adressLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
        adressLabel.leftAnchor.constraint(equalTo: view!.leftAnchor).isActive = true
        adressLabel.rightAnchor.constraint(equalTo: view!.rightAnchor).isActive = true
        adressLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 40).isActive = true
        
    }
    
    
}

