//
//  HomeTableViewViewModel.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/21/21.
//

import Foundation
import CoreData

class HomeTableViewViewModel {
    
//    let context = CoreDataManager().moc
    private let coreDataManager = CoreDataManager()
    var plantList: [Observable<Plant>]? {
        get {
            return getRefreshedPlantList()
        }
    }
    
    // MARK: Init
    
    init() {
        if coreDataManager.isEmpty() {
            InMemoryObjects().loadDemoPlantList()
        }
//        let plants = coreDataManager.fetchPlants()
//        plantList = plants.compactMap { (plant) -> Observable<Plant>? in
//            return Observable(plant)
//        }
//        plantList = getRefreshedPlantList()
    }
    
    func getRefreshedPlantList() -> [Observable<Plant>] {
        let plants = coreDataManager.fetchPlants()
        let observablePlantList = plants.compactMap { (plant) -> Observable<Plant>? in
            return Observable(plant)
        }
        return observablePlantList
    }
    
    
}

