//
//  NewPlantInputCoordinator.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/17/21.
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
        let newPlantInputPageViewController = NewPlantInputPageViewController.instantiate()
        newPlantInputPageViewController.coordinator = self
        navigationController.present(newPlantInputPageViewController, animated: true, completion: nil)
    }
    
}
