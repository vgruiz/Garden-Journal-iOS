//
//  PlantProfileCoordinator.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/27/21.
//

import Foundation
import UIKit

class PlantProfileCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var plantIndexPath: IndexPath
    
    init(plantIndexPath: IndexPath, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.plantIndexPath = plantIndexPath
    }
    
    func start() {
        let viewModel = PlantProfileViewModelForPlant(forPlantIndexPath: plantIndexPath)
        
        let plantProfileViewController = PlantProfileViewController.instantiate()
        plantProfileViewController.plantIndexPath = plantIndexPath
        plantProfileViewController.coordinator = self
        navigationController.pushViewController(plantProfileViewController, animated: true)
        plantProfileViewController.viewModel = viewModel
    }
    
}
