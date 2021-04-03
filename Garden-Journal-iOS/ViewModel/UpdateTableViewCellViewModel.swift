//
//  UpdateTableViewCellViewModel.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/2/21.
//

import Foundation

protocol UpdateTableViewCellViewModel {
    var note: Observable<String> { get }
    var date: Observable<Date> { get }
    var imageData: Observable<Data>? { get }
}
