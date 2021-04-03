//
//  UpdateTableViewCellViewModelForUpdate.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/2/21.
//

import Foundation

class UpdateTableViewCellViewModelForUpdate: UpdateTableViewCellViewModel {
    fileprivate let update: Update

    var note: Observable<String>
    var date: Observable<Date>
    var imageData: Observable<Data>?
    
    init(for update: Update) {
        self.update = update
        self.note = Observable(update.note ?? "")
        self.date = Observable(update.date ?? Date())
        if let data =  update.imageData {
            imageData = Observable(data)
        }
    }
    
}
