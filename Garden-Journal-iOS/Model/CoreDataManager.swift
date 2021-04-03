//
//  CoreDataManager.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/21/21.
//

import CoreData

final class CoreDataManager {
    var plantEntityDesc: NSEntityDescription!
    var updateEntityDesc: NSEntityDescription!
    var plantWorkEntityDesc: NSEntityDescription!
    
    init() {
        plantEntityDesc = NSEntityDescription.entity(forEntityName: "Plant", in: moc)
        updateEntityDesc = NSEntityDescription.entity(forEntityName: "Update", in: moc)
        plantWorkEntityDesc = NSEntityDescription.entity(forEntityName: "PlantWork", in: moc)
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
    
    func isPlantListEmpty() -> Bool {
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
    
    func isUpdateListEmpty(for plant: Plant) -> Bool {
        let updates = fetchUpdates(for: plant)
        return updates.isEmpty
    }
    
    func fetchUpdates(for plant: Plant) -> [Update] {
        do {
            let fetchRequest = NSFetchRequest<Update>(entityName: "Update")
            fetchRequest.predicate = NSPredicate(format: "parentPlant.name MATCHES %@", plant.name as! CVarArg)
            let updates = try moc.fetch(fetchRequest)
            return updates
        } catch {
            print("Error fetching updates for \(plant.name!) \(error)")
            return []
        }
    }
    
    func saveUpdate(for plant: Plant, note: String, date: Date, imageData: Data?, work: [PlantWork]) {
        let update = Update(entity: updateEntityDesc, insertInto: moc)
        update.parentPlant = plant
        update.note = note
        update.date = date
        update.imageData = imageData
//        work.parentUpdate = update
        work.forEach{ $0.parentUpdate = update }
        update.plantWork?.addingObjects(from: work)
    }
    
    func newPlantWork( workName0: String, workName1: String) -> [PlantWork] {
        let work0 = PlantWork(entity: plantWorkEntityDesc, insertInto: moc)
        work0.name = workName0
        work0.workPerformed = true
        let work1 = PlantWork(entity: plantWorkEntityDesc, insertInto: moc)
        work1.name = workName1
        work1.workPerformed = false
        return [work0, work1]
    }
}
