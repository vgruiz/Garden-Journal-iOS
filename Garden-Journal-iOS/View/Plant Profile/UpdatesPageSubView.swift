//
//  UpdatesPageSubView.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/8/21.
//

import Foundation

protocol UpdatesPageSubView {
    var viewModel: UpdatesTableViewViewModel! { get set }
    func reload()
}
