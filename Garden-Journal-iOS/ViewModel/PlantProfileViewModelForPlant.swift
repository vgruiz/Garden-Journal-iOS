//
//  PlantProfileViewModelForPlant.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/28/21.
//

import Foundation
import CoreData

class PlantProfileViewModelForPlant: PlantProfileViewModel {

    private let coreDataManager = CoreDataManager()

    // MARK: PlantProfileViewModel protocol
    let plant: Observable<Plant>
    var name: Observable<String>
    var location: Observable<String>
    var adoptionDate: Observable<Date>
    var pinnedNotes: Observable<String>?
    var profileImageData: Observable<Data>?

    // MARK: Init
    init(forPlantIndexPath indexPath: IndexPath) {
        self.plant = Observable(DataBaseManager.fetchPlants()[indexPath.row])
        self.name = Observable(plant.value.name!)
        self.location = Observable(plant.value.location!)
        self.adoptionDate = Observable(plant.value.adoptionDate!)
        self.pinnedNotes = Observable(plant.value.pinnedNotes ?? "Add any notes about this plant here!")
        if let data = plant.value.profileImageData {
            self.profileImageData = Observable(data)
        }
    }
    
    init(forPlant plant: Plant) {
        self.plant = Observable(plant)
        self.name = Observable(plant.name!)
        self.location = Observable(plant.location!)
        self.adoptionDate = Observable(plant.adoptionDate!)
        if let notes = plant.pinnedNotes {
            self.pinnedNotes = Observable(notes)
        }
        if let data = plant.profileImageData {
            self.profileImageData = Observable(data)
        }
    }
    
    func savePinnedNotes(newPinnedNotes: String) {
//        plant.value.setValue(newPinnedNotes, forKey: "pinnedNotes")
        DataBaseManager.updatePlantProperty(forPlant: self.plant.value,
                                            newPinnedNotes,
                                            forKey: "pinnedNotes")
    }
    
}
