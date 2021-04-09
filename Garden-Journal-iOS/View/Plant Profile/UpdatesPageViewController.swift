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
    private(set) var orderedViewControllers: [UIViewController]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let firstViewController = orderedViewControllers?.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func fillUI() {
        guard let updatesList = viewModel?.updatesList else {
            fatalError("Fatal error getting list of updates.")
        }
        
        if let firstViewController = orderedViewControllers?.first {
            setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }

        for var vc in orderedViewControllers as! [UpdatesPageSubView] {
            vc.viewModel = UpdatesTableViewViewModel(forUpdates: updatesList)
            vc.reload()
        }
    }
    
    func setChildViewControllers(tableViewController: UpdatesTableViewController, collectionViewController: UpdatesCollectionViewController) {
//        orderedViewControllers?.append(tableViewController)
//        orderedViewControllers?.append(collectionViewController)
        orderedViewControllers?.append(contentsOf: [tableViewController, collectionViewController])
    }

}

extension UpdatesPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers?.firstIndex(of: viewController), let count = orderedViewControllers?.count else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers?[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers?.firstIndex(of: viewController), let count = orderedViewControllers?.count else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard count != nextIndex else {
            return nil
        }
        
        guard count > nextIndex else {
            return nil
        }
        
        return orderedViewControllers?[nextIndex]
    }
}

extension UpdatesPageViewController: UIPageViewControllerDelegate {
    
}
