//
//  PlantProfileCoordinator.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/27/21.
//

import Foundation
import UIKit

class PlantProfileCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var plantIndexPath: IndexPath
    var plant: Plant?
    
    init(plantIndexPath: IndexPath, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.plantIndexPath = plantIndexPath
    }
    
    init(plant: Plant, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.plant = plant
        self.plantIndexPath = IndexPath(item: 0, section: 0)
    }
    
    func start() {
        let viewModel = PlantProfileViewModelForPlant(forPlantIndexPath: plantIndexPath)
        
        // create the table view controller and collection view controller and provide them
        // to plantProfileViewController
        
        let plantProfileViewController = PlantProfileViewController.instantiate()
        plantProfileViewController.setChildViewControllers( children: createSubViewControllers() )
        plantProfileViewController.plantIndexPath = plantIndexPath
        plantProfileViewController.coordinator = self
        navigationController.pushViewController(plantProfileViewController, animated: true)
        plantProfileViewController.viewModel = viewModel
    }
    
    func createSubViewControllers() -> [UIViewController] {
        let updatesTableViewController = UpdatesTableViewController.instantiate()
        updatesTableViewController.viewModel = UpdatesTableViewViewModel(for: plant!)
        updatesTableViewController.coordinator = self
        return [updatesTableViewController]
    }
    
}
