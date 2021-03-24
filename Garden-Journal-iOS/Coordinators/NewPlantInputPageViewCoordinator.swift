//
//  NewPlantInputCoordinator.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/17/21.
//

import Foundation
import UIKit

class NewPlantInputPageViewCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
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
            navigationController.present(vc, animated: true, completion: nil)
        }
    }
    
    private func createChildViewControllers() {
        for i in 0..<4 {
            let newPage = NewPlantInputViewController.init(nibName: "NewPlantInputViewController", bundle: nil)
            newPage.loadViewIfNeeded()
            newPage.coordinator = self
            newPage.setInputIndex(i) // used for choosing view model data
            newPage.viewModel = NewPlantFormTableViewViewModel()
            pages.append(newPage)
        }
    }
    
    func addNewPhoto(from inputType: ImageInputType) {
        let imagePickerCoordinator = ImagePickerCoordinator(navigationController: navigationController, type: inputType)
        imagePickerCoordinator.parentCoordinator = self
        childCoordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
    }
    
    public func nextPage(sender: NewPlantInputViewController) {
        newPlantInputPageViewController?.goToNextPage(sender: sender)
    }
    
}
