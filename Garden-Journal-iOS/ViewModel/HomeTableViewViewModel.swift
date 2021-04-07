//
//  HomeTableViewViewModel.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/21/21.
//

import Foundation
import CoreData

class HomeTableViewViewModel {
    
    private let coreDataManager = CoreDataManager()
    var plantList: [Observable<Plant>]? {
        get {
            return getRefreshedPlantList()
        }
    }
    
    // MARK: Init
    init() {
//        if coreDataManager.isPlantListEmpty() {
        if DataBaseManager.isPlantListEmpty() {
            InMemoryObjects().loadDemoData()
        }
    }
    
    func getRefreshedPlantList() -> [Observable<Plant>] {
//        let plants = coreDataManager.fetchPlants()
        let plants = DataBaseManager.fetchPlants()
        let observablePlantList = plants.compactMap { (plant) -> Observable<Plant>? in
            return Observable(plant)
        }
        return observablePlantList
    }
    
}
