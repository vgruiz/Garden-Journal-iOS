//
//  NewPlantInputCoordinator.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/17/21.
//

import Foundation
import UIKit

class NewPlantInputPageViewCoordinator: Coordinator {
    var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var pages = [NewPlantInputViewController]()
    weak var newPlantInputPageViewController: NewPlantInputPageViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        createChildViewControllers()
    }
    
    func start() {
        newPlantInputPageViewController = NewPlantInputPageViewController.instantiate()
        if let vc = newPlantInputPageViewController {
            vc.coordinator = self
            vc.setPages(pages)
            vc.viewModel = NewPlantInputPageViewModel()
            navigationController.present(vc, animated: true, completion: nil)
        }
    }
    
    private func createChildViewControllers() {
        for i in 0..<4 {
            let newPage = NewPlantInputViewController.init(nibName: "NewPlantInputViewController", bundle: nil)
            newPage.loadViewIfNeeded()
            newPage.coordinator = self
            newPage.setInputIndex(i) // used for choosing view model data
            pages.append(newPage)
        }
    }
    
    public func nextPage(sender: NewPlantInputViewController) {
        newPlantInputPageViewController?.goToNextPage(sender: sender)
    }
    
    public func validateInputs() -> Bool {
       return newPlantInputPageViewController!.isInputValid()
    }
    
    func createNewPlantProfile() {
        newPlantInputPageViewController?.createNewPlant()
    }
    
//    func finishAddingPlant(index: Int) {
//        parentCoordinator?.refreshAndGoToNewProfile( index: index ) // or something like that
//        parentCoordinator?.childDidFinish(self)
//    }

    func finishAddingPlant(_ plant: Plant) {
        parentCoordinator?.refreshAndGoToNewProfile(forPlant: plant) // or something like that
        parentCoordinator?.childDidFinish(self)
    }
}
