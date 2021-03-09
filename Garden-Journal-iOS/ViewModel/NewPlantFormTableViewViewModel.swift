//
//  NewPlantFormTableViewViewModel.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/7/21.
//

import Foundation

class NewPlantFormTableViewViewModel {
    var inputList = [NewPlantInput]()
    
    private let coreDataManager = CoreDataManager()
    
    
    init() {
        // creating and loading the static data
        let input0 = NewPlantInput(inputType: .Name,
                                   placeholderText: "Name your plant",
                                   instructionText: "Does your plant have a nickname? Put it here! If not, a species name or anything that will help you identify it in the app.",
                                    locationsList: nil)
        let input1 = NewPlantInput(inputType: .DatePicker,
                                   placeholderText: "Date of adoption",
                                   instructionText: "When did this plant come into your life? Perhaps when it was gifted to you. Maybe it was the day you planted its seeds in the soil!",
                                   locationsList: nil )
        
        //get locations from core data
        let plants = coreDataManager.fetchPlants()
        let locations = Set( plants.compactMap { $0.location } )
        
        let input2 = NewPlantInput(inputType: .Location,
                                   placeholderText: "Location",
                                   instructionText: "Where is this plant currently residing? Choose from your other locations or add a new one!",
                                   locationsList: Array(locations))
        let input3 = NewPlantInput(inputType: .Image,
                                   placeholderText: nil,
                                   instructionText: "Show us a picture! Add one from your photos, take a new one, or add one later on your Plant's Profile.",
                                   locationsList: nil)

        inputList.append(input0)
        inputList.append(input1)
        inputList.append(input2)
        inputList.append(input3)
    }
    
}

enum InputType {
    case Location
    case Image
    case Name
    case DatePicker
}

struct NewPlantInput {
    var inputType: InputType
    var placeholderText: String?
    var instructionText: String
    var locationsList: [String]?
}
