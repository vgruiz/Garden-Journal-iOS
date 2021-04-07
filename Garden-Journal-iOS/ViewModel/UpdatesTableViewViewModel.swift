//
//  UpdatesTableViewViewModel.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/2/21.
//

import Foundation
import CoreData

class UpdatesTableViewViewModel {
    
    private let coreDataManager = CoreDataManager()
//    private let plant: Plant
    var updatesList: [Observable<Update>]?
//    {
//        get {
//            return getRefreshedUpdateList()
//        }
//    }
    
    // MARK: Init
    init(forUpdates updates: [Observable<Update>] ) {
        updatesList = updates
//        self.plant = plant
//        if coreDataManager.isUpdateListEmpty(for: plant) {
//            InMemoryObjects().loadDemoUpdatesList(for: plant)
//        }
    }
    
//    func getRefreshedUpdateList() -> [Observable<Update>] {
//        let updates = coreDataManager.fetchUpdates(for: self.plant)
//        let observableUpdateList = updates.compactMap { (update) -> Observable<Update>? in
//            return Observable(update)
//        }
//        return observableUpdateList
//    }
}
