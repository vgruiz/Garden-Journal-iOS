//
//  NewPlantInputTableViewCellViewModel.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/8/21.
//

import Foundation

protocol NewPlantInputViewModel {
    var type: InputType { get }
    var placeholderText: String? { get }
    var instructionText: String { get }
    var locationsList: Observable<[String]>? { get set }
}
