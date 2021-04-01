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
    
    func savePlant(name: String, adoptionDate: Date, location: String, imageData: Data?, pinnedNotes: String?) -> Int {
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
        
        return indexOf(plant: plant)
    }
    
    func createNewPlant( name: String, adoptionDate: Date, location: String, imageData: Data?, pinnedNotes: String? ) -> Plant {
        let plant = Plant(entity: plantEntityDesc, insertInto: moc)
        plant.name = name
        plant.adoptionDate = adoptionDate
        plant.location = location
        
        if let data = imageData {
            plant.profileImageData = data
        }
        plant.pinnedNotes = pinnedNotes ?? ""
        
        return plant
    }
    
    func isEmpty() -> Bool {
        let plants = fetchPlants()
        return plants.isEmpty
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
    
    func indexOf(plant: Plant) -> Int {
        let plants = fetchPlants()
        return (plants.firstIndex(of: plant) ?? 0) as Int
    }
}
