//
//  NewPlantInputTableViewCellViewModel.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/8/21.
//

import Foundation

protocol NewPlantInputTableViewCellViewModel {
    var newPlantInput: NewPlantInput { get }
    var placeholderText: String? { get }
    var instructionText: String { get }
    var locationsList: Observable<[String]>?
}
