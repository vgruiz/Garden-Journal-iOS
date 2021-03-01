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
        
        coreDataManager.savePlant(name: "Planty",
                                  adoptionDate: Date(),
                                  location: "Bedroom",
                                  imageData: UIImage(named: "bonsai0")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
        
        coreDataManager.savePlant(name: "Planteen",
                                  adoptionDate: Date(),
                                  location: "Bedroom",
                                  imageData: UIImage(named: "bonsai1")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
        
        coreDataManager.savePlant(name: "Plantoo",
                                  adoptionDate: Date(),
                                  location: "Bedroom",
                                  imageData: UIImage(named: "monstera")?.jpegData(compressionQuality: 1.0),
                                  pinnedNotes: nil)
    }
    
}
