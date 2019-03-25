//
//  CoreDataManager.swift
//  TaskFiveContactsBase
//
//  Created by Andrey Petrovskiy on 3/24/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation

import CoreData


class CoreDataManager {
    
    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ContactBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error{
                print("Fatal errorLoading of store failed \(error)")
            }
        })
        return container
    }()


}
