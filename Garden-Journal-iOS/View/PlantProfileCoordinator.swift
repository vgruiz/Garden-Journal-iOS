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
//        let viewModel = PlantProfileViewModelForPlant(forPlantIndexPath: plantIndexPath)
        guard let plant = plant else {
            fatalError()
        }
        let viewModel = PlantProfileViewModelForPlant(forPlant: plant)
        
        let plantProfileViewController = PlantProfileViewController.instantiate()
//        plantProfileViewController.plantIndexPath = plantIndexPath
        plantProfileViewController.coordinator = self
        navigationController.pushViewController(plantProfileViewController, animated: true)
        plantProfileViewController.setUpdatesPageViewController( startUpdatesPageViewController() )
        plantProfileViewController.viewModel = viewModel
    }
    
    func startUpdatesPageViewController() -> UpdatesPageViewController {
        // create table view controller
        let updatesTableViewController = UpdatesTableViewController.instantiate()
        updatesTableViewController.coordinator = self
        
        //-----------------------------------
        // create collection view controller

        //-----------------------------------
        
        let updatesPageViewController = UpdatesPageViewController.instantiate()
        updatesPageViewController.setChildViewControllers(tableViewController: updatesTableViewController, collectionViewController: UpdatesCollectionViewController())
        updatesPageViewController.viewModel = UpdatesPageViewViewModel(forPlant: plant!)
        updatesPageViewController.coordinator = self
        
        return updatesPageViewController
    }
    
}
