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
//    var location: Observable<String>
//    var adoptionDate: Observable<Date>
//    var pinnedNotes: Observable<String>
//    var profileImageData: Observable<Data>

    // MARK: Init

    init(forPlantIndexPath indexPath: IndexPath) {
        let plant = Observable(coreDataManager.fetchPlants()[indexPath.row])
        self.name = Observable(plant.value.name!)
    }
    
//    init(forPlant plant: Observable<Plant>) {
////        self.plant = plant
//        let plantVal = plant.value
//        self.name = Observable(plantVal.name!)
////        self.location = Observable(plantVal.location)
////        self.adoptionDate = Observable(plantVal.adoptionDate)
////        self.pinnedNotes = Observable(plantVal.pinnedNotes)
////        self.profileImageData = Observable(plantVal.profileImageData)
//    }


}
