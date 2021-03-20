//
//  MainCoordinator.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/27/21.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
  
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let homeViewController = HomeViewController.instantiate()
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: false)
    }
    
    func goToPlantProfile(forPlantIndexPath indexPath: IndexPath ) {
        let plantProfileCoordinator = PlantProfileCoordinator(plantIndexPath: indexPath, navigationController: navigationController)
        plantProfileCoordinator.parentCoordinator = self
        childCoordinators.append(plantProfileCoordinator)
        plantProfileCoordinator.start()
    }
    
    func addNewPlant() {
//        let addNewPlantCoordinator = AddNewPlantCoordinator(navigationController: navigationController)
//        addNewPlantCoordinator.parentCoordinator = self
//        childCoordinators.append(addNewPlantCoordinator)
//        addNewPlantCoordinator.start()
        let newPlantInputCoordinator = NewPlantInputCoordinator(navigationController: navigationController)
        newPlantInputCoordinator.parentCoordinator = self
        childCoordinators.append(newPlantInputCoordinator)
        newPlantInputCoordinator.start()
    }
    
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    
}

//extension MainCoordinator: UINavigationControllerDelegate, NSObject {
//
//}
