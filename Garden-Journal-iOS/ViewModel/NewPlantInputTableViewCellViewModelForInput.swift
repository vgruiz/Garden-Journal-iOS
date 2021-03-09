//
//  NewPlantInputTableViewCellViewModelForInput.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/8/21.
//

import Foundation

class NewPlantInputTableViewCellViewModelForInput : NewPlantInputTableViewCellViewModel {

//    let coreDataManager = CoreDataManager()

    var newPlantInput: NewPlantInput
    var placeholderText: String?
    var instructionText: String
    var locationsList: Observable<[String]>?
    
    init(_ newInput: NewPlantInput) {
        self.newPlantInput = newInput
        self.placeholderText = newPlantInput.placeholderText
        self.instructionText = newPlantInput.instructionText
        if let locations = newPlantInput.locationsList {
            self.locationsList = Observable(locations)
        }
    }
}
