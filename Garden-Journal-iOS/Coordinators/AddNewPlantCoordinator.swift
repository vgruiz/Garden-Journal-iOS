//
//  AddNewPlantCoordinator.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/1/21.
//

import Foundation
import UIKit

class AddNewPlantCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addNewPlantViewController = AddNewPlantViewController.instantiate()
        addNewPlantViewController.coordinator = self
        navigationController.present(addNewPlantViewController, animated: true, completion: nil)
    }
}
