//
//  NewPlantInputPageViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/17/21.
//

import UIKit

class NewPlantInputPageViewController: UIPageViewController, UIPageViewControllerDelegate, Storyboarded {
    
    var coordinator: NewPlantInputPageViewCoordinator?
    var viewModel: NewPlantFormTableViewViewModel? {
        didSet {
            fillUI()
        }
    }
    private(set) var orderedInputViewControllers: [NewPlantInputViewController]?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedInputViewControllers?.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    public func setPages(_ pages: [NewPlantInputViewController]) {
        orderedInputViewControllers = pages
        
    }
    
    private func fillUI() {
        let inputList = viewModel!.inputList
        
        for i in 0..<orderedInputViewControllers!.count {
            orderedInputViewControllers![i].viewModel = NewPlantInputTableViewCellViewModelForInput(inputList[i])
        }
    }
    
    func goToNextPage(sender: NewPlantInputViewController) {
        guard let viewControllerIndex = orderedInputViewControllers?.firstIndex(of: sender), let count = orderedInputViewControllers?.count else {
            return
        }

        let nextIndex = viewControllerIndex + 1

        guard count != nextIndex else {
            return
        }

        guard count > nextIndex else {
            return
        }

        self.setViewControllers([orderedInputViewControllers![nextIndex]], direction: .forward, animated: true, completion: nil)

    }
    
}

extension NewPlantInputPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedInputViewControllers?.firstIndex(of: viewController as! NewPlantInputViewController), let count = orderedInputViewControllers?.count else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard count > previousIndex else {
            return nil
        }
        
        return orderedInputViewControllers![previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedInputViewControllers?.firstIndex(of: viewController as! NewPlantInputViewController), let count = orderedInputViewControllers?.count else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard count != nextIndex else {
            return nil
        }
        
        guard count > nextIndex else {
            return nil
        }
        
        return orderedInputViewControllers![nextIndex]
    }
}
