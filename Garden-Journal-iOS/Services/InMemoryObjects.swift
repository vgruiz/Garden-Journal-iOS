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
        _ = DataBaseManager.savePlant(name: "Planty",
                                  adoptionDate: Date(),
                                  location: "Bedroom",
                                  imageData: UIImage(named: "bonsai0")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
        
        _ = DataBaseManager.savePlant(name: "Planteen",
                                  adoptionDate: Date(),
                                  location: "Backyard",
                                  imageData: UIImage(named: "bonsai1")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
        
        _ = DataBaseManager.savePlant(name: "Plantoo",
                                  adoptionDate: Date(),
                                  location: "Office",
                                  imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
    }
    
    func loadDemoData() {
        let plant0 = DataBaseManager.createNewPlant(name: "Planty",
                                  adoptionDate: Date(),
                                  location: "Bedroom",
                                  imageData: UIImage(named: "bonsai0")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
        loadDemoUpdatesList(for: plant0)
        
        let plant1 = DataBaseManager.createNewPlant(name: "Planteen",
                                  adoptionDate: Date(),
                                  location: "Backyard",
                                  imageData: UIImage(named: "bonsai1")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
        loadDemoUpdatesList(for: plant1)
        
        let plant2 = DataBaseManager.createNewPlant(name: "Plantoo",
                                  adoptionDate: Date(),
                                  location: "Office",
                                  imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
        loadDemoUpdatesList(for: plant2)
    }
    
    func loadDemoUpdatesList(for plant: Plant) {
        DataBaseManager.saveUpdate(for: plant,
                                       note: "Plant is gud.",
                                       date: Date(),
                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                       work: DataBaseManager.newPlantWork(workName0: "Watered", workName1: "Repotted"))
        DataBaseManager.saveUpdate(for: plant,
                                       note: "Plant is dandy.",
                                       date: Date(),
                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                       work: DataBaseManager.newPlantWork(workName0: "Watered", workName1: "Repotted"))
        DataBaseManager.saveUpdate(for: plant,
                                       note: "Plant is superb.",
                                       date: Date(),
                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                       work: DataBaseManager.newPlantWork(workName0: "Watered", workName1: "Repotted"))
        DataBaseManager.saveUpdate(for: plant,
                                       note: "Plant is bad.",
                                       date: Date(),
                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                       work: DataBaseManager.newPlantWork(workName0: "Watered", workName1: "Repotted"))
        DataBaseManager.saveUpdate(for: plant,
                                       note: "Plant is better.",
                                       date: Date(),
                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                       work: DataBaseManager.newPlantWork(workName0: "Watered", workName1: "Repotted"))
    }
    
    
}

//    func loadDemoPlantList() {
//        _ = coreDataManager.savePlant(name: "Planty",
//                                  adoptionDate: Date(),
//                                  location: "Bedroom",
//                                  imageData: UIImage(named: "bonsai0")?.jpegData(compressionQuality: 1.0),
//                                  pinnedNotes: nil)
//
//        _ = coreDataManager.savePlant(name: "Planteen",
//                                  adoptionDate: Date(),
//                                  location: "Backyard",
//                                  imageData: UIImage(named: "bonsai1")?.jpegData(compressionQuality: 1.0),
//                                  pinnedNotes: nil)
//
//        _ = coreDataManager.savePlant(name: "Plantoo",
//                                  adoptionDate: Date(),
//                                  location: "Office",
//                                  imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
//                                  pinnedNotes: nil)
//    }
//
//    func loadDemoData() {
//        let plant0 = coreDataManager.createNewPlant(name: "Planty",
//                                  adoptionDate: Date(),
//                                  location: "Bedroom",
//                                  imageData: UIImage(named: "bonsai0")?.jpegData(compressionQuality: 1.0),
//                                  pinnedNotes: nil)
//        loadDemoUpdatesList(for: plant0)
//
//        let plant1 = coreDataManager.createNewPlant(name: "Planteen",
//                                  adoptionDate: Date(),
//                                  location: "Backyard",
//                                  imageData: UIImage(named: "bonsai1")?.jpegData(compressionQuality: 1.0),
//                                  pinnedNotes: nil)
//        loadDemoUpdatesList(for: plant1)
//
//        let plant2 = coreDataManager.createNewPlant(name: "Plantoo",
//                                  adoptionDate: Date(),
//                                  location: "Office",
//                                  imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
//                                  pinnedNotes: nil)
//        loadDemoUpdatesList(for: plant2)
//    }
//
//    func loadDemoUpdatesList(for plant: Plant) {
//        coreDataManager.saveUpdate(for: plant,
//                                   context: plant.managedObjectContext!,
//                                       note: "Plant is gud.",
//                                       date: Date(),
//                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
//                                       work: coreDataManager.newPlantWork(context: plant.managedObjectContext!, workName0: "Watered", workName1: "Repotted"))
//        coreDataManager.saveUpdate(for: plant,
//                                   context: plant.managedObjectContext!,
//                                       note: "Plant is dandy.",
//                                       date: Date(),
//                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
//                                       work: coreDataManager.newPlantWork(context: plant.managedObjectContext!, workName0: "Watered", workName1: "Repotted"))
//        coreDataManager.saveUpdate(for: plant,
//                                   context: plant.managedObjectContext!,
//                                       note: "Plant is superb.",
//                                       date: Date(),
//                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
//                                       work: coreDataManager.newPlantWork(context: plant.managedObjectContext!, workName0: "Watered", workName1: "Repotted"))
//        coreDataManager.saveUpdate(for: plant,
//                                   context: plant.managedObjectContext!,
//                                       note: "Plant is bad.",
//                                       date: Date(),
//                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
//                                       work: coreDataManager.newPlantWork(context: plant.managedObjectContext!, workName0: "Watered", workName1: "Repotted"))
//        coreDataManager.saveUpdate(for: plant,
//                                   context: plant.managedObjectContext!,
//                                       note: "Plant is better.",
//                                       date: Date(),
//                                       imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
//                                       work: coreDataManager.newPlantWork(context: plant.managedObjectContext!, workName0: "Watered", workName1: "Repotted"))
//    }
