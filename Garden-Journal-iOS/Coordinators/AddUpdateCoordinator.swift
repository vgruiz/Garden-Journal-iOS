//
//  AddNewUpdateCoordinator.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/13/21.
//

import Foundation
import UIKit

final class AddUpdateCoordinator: Coordinator {
    var parentCoordinator: PlantProfileCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addUpdateViewController = AddUpdateViewController.instantiate()
        addUpdateViewController.coordinator = self
        navigationController.pushViewController(addUpdateViewController, animated: true)
    }
    
    
}
