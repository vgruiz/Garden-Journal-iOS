//
//  DataBaseManager.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/4/21.
//

import Foundation
import CoreData

class DataBaseManager: NSObject {
    
    var plantEntityDesc: NSEntityDescription!
    var updateEntityDesc: NSEntityDescription!
    var plantWorkEntityDesc: NSEntityDescription!
    
    override init() {
        super.init()
        plantEntityDesc = NSEntityDescription.entity(forEntityName: "Plant", in: CoreDataManager.moc)
        updateEntityDesc = NSEntityDescription.entity(forEntityName: "Update", in: CoreDataManager.moc)
        plantWorkEntityDesc = NSEntityDescription.entity(forEntityName: "PlantWork", in: CoreDataManager.moc)
    }
    
    class func savePlant(name: String,
                   adoptionDate: Date,
                   location: String,
                   imageData: Data?,
                   pinnedNotes: String?) -> Int {
//        let context = CoreDataManager.moc
        
//        let plant = Plant(entity: plantEntityDesc, insertInto: CoreDataManager.moc)
//        let work0 = NSEntityDescription.insertNewObject(forEntityName: "PlantWork", into: context) as! PlantWork
        let plant = NSEntityDescription.insertNewObject(forEntityName: "Plant", into: CoreDataManager.moc) as! Plant
        plant.name = name
        plant.adoptionDate = adoptionDate
        plant.location = location
        
        if let data = imageData {
            plant.profileImageData = data
        }
        plant.pinnedNotes = pinnedNotes ?? ""
        
        do {
//            try moc.save()
            try CoreDataManager.moc.save()
        } catch {
            print( "Error saving core data: \(error)")
        }
        
        return indexOf(plant: plant)
    }
    
    class func createNewPlant( name: String, adoptionDate: Date, location: String, imageData: Data?, pinnedNotes: String? ) -> Plant {
//        let plant = Plant(entity: plantEntityDesc, insertInto: CoreDataManager.moc)
        let plant = NSEntityDescription.insertNewObject(forEntityName: "Plant", into: CoreDataManager.moc) as! Plant
        plant.name = name
        plant.adoptionDate = adoptionDate
        plant.location = location
        
        if let data = imageData {
            plant.profileImageData = data
        }
        plant.pinnedNotes = pinnedNotes ?? ""

        do {
            //try moc.save()
            try CoreDataManager.moc.save()
        } catch {
            print( "Error saving core data: \(error)")
        }
        
        return plant
    }
    
    static func isPlantListEmpty() -> Bool {
        let plants = fetchPlants()
        return plants.isEmpty
    }
    
    class func fetchPlants() -> [Plant] {
        do {
            let fetchRequest = NSFetchRequest<Plant>(entityName: "Plant")
//            let plants = try moc.fetch(fetchRequest)
            let plants = try CoreDataManager.moc.fetch(fetchRequest)
            return plants
        } catch {
            print("Error fetching Plants: \(error)")
            return []
        }
    }
    
    class func indexOf(plant: Plant) -> Int {
        let plants = fetchPlants()
        return (plants.firstIndex(of: plant) ?? 0) as Int
    }
    
    class func isUpdateListEmpty(for plant: Plant) -> Bool {
        let updates = fetchUpdates(for: plant)
        return updates.isEmpty
    }
    
    class func fetchUpdates(for plant: Plant) -> [Update] {
        do {
            let fetchRequest = NSFetchRequest<Update>(entityName: "Update")
            fetchRequest.predicate = NSPredicate(format: "parentPlant.name MATCHES %@", plant.name!)
//            let updates = try moc.fetch(fetchRequest)
            let updates = try CoreDataManager.moc.fetch(fetchRequest)
            return updates
        } catch {
            print("Error fetching updates for \(plant.name!) \(error)")
            return []
        }
    }
    
    class func saveUpdate(for plant: Plant, context: NSManagedObjectContext, note: String, date: Date, imageData: Data?, work: [PlantWork]) {
//        let update = Update(entity: updateEntityDesc, insertInto: context)
        let update = NSEntityDescription.insertNewObject(forEntityName: "Update", into: CoreDataManager.moc) as! Update
//        update.parentPlant = plant
        update.note = note
        update.date = date
        update.imageData = imageData
//        work.parentUpdate = update
        work.forEach{ $0.parentUpdate = update }
        update.plantWork?.addingObjects(from: work)
        
        plant.addToUpdates(update)
    }
    
    class func saveUpdate(for plant: Plant, note: String, date: Date, imageData: Data?, work: [PlantWork]) {
//        let update = Update(entity: updateEntityDesc, insertInto: CoreDataManager.moc)
        let update = NSEntityDescription.insertNewObject(forEntityName: "Update", into: CoreDataManager.moc) as! Update
//        update.parentPlant = plant
        update.note = note
        update.date = date
        update.imageData = imageData
//        work.parentUpdate = update
        work.forEach{ $0.parentUpdate = update }
        update.plantWork?.addingObjects(from: work)
        
        plant.addToUpdates(update)
    }
    
    class func newPlantWork(context: NSManagedObjectContext, workName0: String, workName1: String) -> [PlantWork] {
        let work0 = NSEntityDescription.insertNewObject(forEntityName: "PlantWork", into: context) as! PlantWork
        work0.name = workName0
        work0.workPerformed = true
//        let work1 = PlantWork(entity: plantWorkEntityDesc, insertInto: context)
        let work1 = NSEntityDescription.insertNewObject(forEntityName: "PlantWork", into: context) as! PlantWork
        work1.name = workName1
        work1.workPerformed = false
        return [work0, work1]
    }

    class func newPlantWork(workName0: String, workName1: String) -> [PlantWork] {
        let work0 = NSEntityDescription.insertNewObject(forEntityName: "PlantWork", into: CoreDataManager.moc) as! PlantWork
        work0.name = workName0
        work0.workPerformed = true
//        let work1 = PlantWork(entity: plantWorkEntityDesc, insertInto: context)
        let work1 = NSEntityDescription.insertNewObject(forEntityName: "PlantWork", into: CoreDataManager.moc) as! PlantWork
        work1.name = workName1
        work1.workPerformed = false
        return [work0, work1]
    }
    
    class func updatePlantProperty(forPlant plant: Plant, _ value: Any?, forKey key: String ) {
        plant.setValue(value, forKey: key)
        save(withErrorMessage: "Error updating plant property in core data")
    }
    
    private class func save(withErrorMessage message: String = "Error saving in core data") {
        do {
            //try moc.save()
            try CoreDataManager.moc.save()
        } catch {
            print( "\(message): \(error)")
        }
    }

}
