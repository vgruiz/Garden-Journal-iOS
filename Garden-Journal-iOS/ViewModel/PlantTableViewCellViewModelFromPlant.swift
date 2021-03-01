//
//  PlantTableViewCellViewModel.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/21/21.
//

import Foundation

class PlantTableViewCellViewModelFromPlant : PlantTableViewCellViewModel {
    fileprivate let plant: Plant
    
    // MARK: PlantTableViewCellViewModel protocol
    
    let plantName: Observable<String>
    let plantImageData: Observable<Data>
    
    // MARK: Init
    init(from plant: Plant) {
        self.plant = plant
        self.plantName = Observable(plant.name ?? "")
        self.plantImageData = Observable(plant.profileImageData ?? Data())
    }
}
