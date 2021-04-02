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
//    let plant: Observable<Plant>

    // MARK: PlantProfileViewModel protocol
    
    var name: Observable<String>
    var location: Observable<String>
    var adoptionDate: Observable<Date>
//    var pinnedNotes: Observable<String>
    var profileImageData: Observable<Data>?

    // MARK: Init

    init(forPlantIndexPath indexPath: IndexPath) {
        let plant = Observable(coreDataManager.fetchPlants()[indexPath.row])
        self.name = Observable(plant.value.name!)
        self.location = Observable(plant.value.location!)
        self.adoptionDate = Observable(plant.value.adoptionDate!)
//        self.pinnedNotes = Observable(plant.value.pinnedNotes)
        if let data = plant.value.profileImageData {
            self.profileImageData = Observable(data)
        }
    }
    
}
