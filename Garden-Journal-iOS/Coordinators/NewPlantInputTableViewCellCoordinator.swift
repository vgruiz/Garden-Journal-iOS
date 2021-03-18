//
//  NewPlantInputTableViewCellCoordinator.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/14/21.
//

import Foundation
import UIKit

class NewPlantInputTableViewCellCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }

    func addNewPhoto(from inputType: ImageInputType) {
        let imagePickerCoordinator = ImagePickerCoordinator(navigationController: navigationController, type: inputType)
        imagePickerCoordinator.parentCoordinator = self
        childCoordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
    }
    
}
