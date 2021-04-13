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
    var updatesList: [Observable<Update>]?
    // MARK: Init
    init(forUpdates updates: [Observable<Update>] ) {
        updatesList = updates
    }

    init(forUpdates updates: [Update] ) {
        updatesList = updates.compactMap({ (update) -> Observable<Update>? in
            return Observable(update)
        })
    }
}
