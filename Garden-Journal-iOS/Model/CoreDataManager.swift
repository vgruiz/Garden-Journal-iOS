//
//  CoreDataManager.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/21/21.
//

import CoreData

final class CoreDataManager {
    var plantEntityDesc: NSEntityDescription!
    
    init() {
        plantEntityDesc = NSEntityDescription.entity(forEntityName: "Plant", in: moc)
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "Garden_Journal_iOS")
        persistentContainer.loadPersistentStores { (_, error) in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func savePlant(name: String, adoptionDate: Date, location: String, imageData: Data?, pinnedNotes: String?) {
        let plant = Plant(entity: plantEntityDesc, insertInto: moc)
        plant.name = name
        plant.adoptionDate = adoptionDate
        plant.location = location
        
        if let data = imageData {
            plant.profileImageData = data
        }
        plant.pinnedNotes = pinnedNotes ?? ""
        
        do {
            try moc.save()
        } catch {
            print( "Error saving core data: \(error)")
        }
        
    }
    
    func fetchPlants() -> [Plant] {
        do {
            let fetchRequest = NSFetchRequest<Plant>(entityName: "Plant")
            let plants = try moc.fetch(fetchRequest)
            return plants
        } catch {
            print("Error fetching Plants: \(error)")
            return []
        }
    }
}
