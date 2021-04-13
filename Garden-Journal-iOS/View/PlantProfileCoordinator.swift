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
    var plantIndexPath: IndexPath?
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
//        guard let plant = plant else {
//            fatalError()
//        }
        var viewModel: PlantProfileViewModelForPlant?
        let plantProfileViewController = PlantProfileViewController.instantiate()
        
        if let plant = plant {
            viewModel = PlantProfileViewModelForPlant(forPlant: plant)
        } else if let indexPath = plantIndexPath {
            viewModel = PlantProfileViewModelForPlant(forPlantIndexPath: indexPath)
            plantProfileViewController.plantIndexPath = indexPath
        }
        plantProfileViewController.viewModel = viewModel
        
        plantProfileViewController.coordinator = self
        navigationController.pushViewController(plantProfileViewController, animated: true)
        plantProfileViewController.setUpdatesPageViewController( startUpdatesPageViewController() )
    }
    
    func startUpdatesPageViewController() -> UpdatesPageViewController {
        let updatesPageViewController = UpdatesPageViewController.instantiate()
        updatesPageViewController.coordinator = self
        updatesPageViewController.viewModel = UpdatesPageViewViewModel(forPlant: plant!)

        guard let updatesList = updatesPageViewController.viewModel?.updatesList else {
            fatalError()
        }
        // create table view controller
        let updatesTableViewController = UpdatesTableViewController.instantiate()
        updatesTableViewController.coordinator = self
        updatesTableViewController.viewModel = UpdatesTableViewViewModel(forUpdates: updatesList)
        
        //-----------------------------------
        // create collection view controller
        let updatesCollectionViewController = UpdatesCollectionViewController.instantiate()
        updatesCollectionViewController.coordinator = self
        updatesCollectionViewController.viewModel = UpdatesTableViewViewModel(forUpdates: updatesList)

        //-----------------------------------

        updatesPageViewController.setChildViewControllers(
            tableViewController: updatesTableViewController,
            collectionViewController: updatesCollectionViewController
        )
        
        return updatesPageViewController
    }
    
    
    
}
