//
//  InMemoryObjects.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/23/21.
//

import Foundation
import UIKit
import CoreData

class InMemoryObjects {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let coreDataManager = CoreDataManager()
    
    func loadDemoPlantList() {
        _ = coreDataManager.savePlant(name: "Planty",
                                  adoptionDate: Date(),
                                  location: "Bedroom",
                                  imageData: UIImage(named: "bonsai0")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
        
        _ = coreDataManager.savePlant(name: "Planteen",
                                  adoptionDate: Date(),
                                  location: "Backyard",
                                  imageData: UIImage(named: "bonsai1")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
        
        _ = coreDataManager.savePlant(name: "Plantoo",
                                  adoptionDate: Date(),
                                  location: "Office",
                                  imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
    }
    
    func loadDemoUpdatesList(for plant: Plant) {
        coreDataManager.saveUpdate(for: plant,
                                       note: "Plant is gud.",
                                       date: Date(),
                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                       work: coreDataManager.newPlantWork(workName0: "Watered", workName1: "Repotted"))
        coreDataManager.saveUpdate(for: plant,
                                       note: "Plant is dandy.",
                                       date: Date(),
                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                       work: coreDataManager.newPlantWork(workName0: "Watered", workName1: "Repotted"))
        coreDataManager.saveUpdate(for: plant,
                                       note: "Plant is superb.",
                                       date: Date(),
                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                       work: coreDataManager.newPlantWork(workName0: "Watered", workName1: "Repotted"))
        coreDataManager.saveUpdate(for: plant,
                                       note: "Plant is bad.",
                                       date: Date(),
                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                       work: coreDataManager.newPlantWork(workName0: "Watered", workName1: "Repotted"))
        coreDataManager.saveUpdate(for: plant,
                                       note: "Plant is better.",
                                       date: Date(),
                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                       work: coreDataManager.newPlantWork(workName0: "Watered", workName1: "Repotted"))
    }
    
}
