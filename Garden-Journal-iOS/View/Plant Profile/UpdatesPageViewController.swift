//
//  UpdatesPageViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/3/21.
//

import UIKit

class UpdatesPageViewController: UIPageViewController, Storyboarded {

    var coordinator: PlantProfileCoordinator?
    var viewModel: UpdatesPageViewViewModel? {
        didSet {
            fillUI()
        }
    }
    private(set) var updatesTableViewController: UpdatesTableViewController?
    private(set) var updatesCollectionViewController: UpdatesCollectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let firstViewController = updatesTableViewController {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func fillUI() {
        guard let updatesList = viewModel?.updatesList else {
            fatalError("Fatal error getting list of updates.")
        }
        
        updatesTableViewController?.viewModel = UpdatesTableViewViewModel(forUpdates: updatesList)
//        updatesCollectionViewController.viewModel = UpdatesCollectionViewViewModel(forUpdates: updatesList)
        
        if let firstViewController = updatesTableViewController {
            setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
        
        updatesTableViewController?.tableView.reloadData()
    }
    
    func setChildViewControllers(tableViewController: UpdatesTableViewController, collectionViewController: UpdatesCollectionViewController) {
        updatesTableViewController = tableViewController
        updatesCollectionViewController = collectionViewController
    }

}

extension UpdatesPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
}

extension UpdatesPageViewController: UIPageViewControllerDelegate {
    
}
