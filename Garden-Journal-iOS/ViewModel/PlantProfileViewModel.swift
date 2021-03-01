//
//  PlantProfileViewModel.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/28/21.
//

import Foundation

protocol PlantProfileViewModel {
    var name: Observable<String> { get }
//    var location: Observable<String> { get }
//    var adoptionDate: Observable<Date> { get }
//    var pinnedNotes: Observable<String> { get }
//    var profileImageData: Observable<Data> { get }
}

//class PlantProfileViewModel {
//
//    private let coreDataManager = CoreDataManager()
//    let plant: Observable<Plant>
//
//    init(forPlant plant: Observable<Plant>) {
//        self.plant = plant
//    }
//
//
//}
