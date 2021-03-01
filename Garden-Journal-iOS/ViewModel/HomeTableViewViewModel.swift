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
    var plantList: [Observable<Plant>]?
    
    // MARK: Init
    
    init() {
        InMemoryObjects().loadDemoPlantList()
        let plants = coreDataManager.fetchPlants()
        print( "number of plants: \(plants.count)")
//        plantList = plants.map({ (plant) -> Observable<Plant> in
//            return Observable(plant)
//        })
        
        plantList = plants.compactMap { (plant) -> Observable<Plant>? in
            return Observable(plant)
        }
        print( "plantList.count: \(plantList?.count)")
    }
    
    func tappedAddPlantButton() {
        
    }
    
}
