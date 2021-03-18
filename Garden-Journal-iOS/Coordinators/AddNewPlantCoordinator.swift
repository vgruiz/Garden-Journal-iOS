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
    var cellCoordinators = [NewPlantInputTableViewCellCoordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        for _ in 0..<4 {
            cellCoordinators.append(NewPlantInputTableViewCellCoordinator(navigationController: navigationController))
        }
    }
    
    func start() {
        let addNewPlantViewController = AddNewPlantViewController.instantiate()
        addNewPlantViewController.coordinator = self
        childCoordinators.append(contentsOf: cellCoordinators)
        addNewPlantViewController.cellCoordinators = self.cellCoordinators
        navigationController.present(addNewPlantViewController, animated: true, completion: nil)
    }
    
    // make a collection of 4 coordinators for each cell
    // pass it to the view controller
    // view controller passes it to tableview
    // table view referre3nces those coordinators when making cells
}
