//
//  NewPlantInputCoordinator.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/21/21.
//

import Foundation
import UIKit

class NewPlantInputCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let newPlantInputViewController = NewPlantInputViewController.instantiate()
//        newPlantInputViewController.coordinator = self
        navigationController.present(newPlantInputViewController, animated: true, completion: nil)
    }
    
    
}
