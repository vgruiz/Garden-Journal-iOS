//
//  PlantTableViewCellViewModel.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/21/21.
//

import Foundation

protocol PlantTableViewCellViewModel {
    var plantName: Observable<String> { get }
    var plantImageData: Observable<Data> { get }
}
