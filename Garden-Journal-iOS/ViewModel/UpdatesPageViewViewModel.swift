//
//  UpdatesPageViewViewModel.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/3/21.
//

import Foundation
import CoreData

class UpdatesPageViewViewModel {
    
    private let coreDataManager = CoreDataManager()
    private let plant: Plant
    var updatesList: [Observable<Update>]? {
        get {
//            let updates = coreDataManager.fetchUpdates(for: self.plant)
            let updates = DataBaseManager.fetchUpdates(for: self.plant)
            let observableUpdateList = updates.compactMap { (update) -> Observable<Update>? in
                return Observable(update)
            }
            return observableUpdateList
        }
    }
    
    init(forPlant plant: Plant) {
        self.plant = plant
        if DataBaseManager.isUpdateListEmpty(for: plant) {
            InMemoryObjects().loadDemoUpdatesList(for: plant)
        }
    }
    
}
