//
//  NewPlantInputTableViewCellViewModelForInput.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/8/21.
//

import Foundation

class NewPlantInputViewModelForInput : NewPlantInputViewModel {

    var type: InputType
    var placeholderText: String?
    var instructionText: String
    var locationsList: Observable<[String]>?
    
    init(_ newInput: NewPlantInput) {
        self.type = newInput.inputType
        self.placeholderText = newInput.placeholderText
        self.instructionText = newInput.instructionText
        if let locations = newInput.locationsList {
            self.locationsList = Observable(locations)
        }
    }
}
