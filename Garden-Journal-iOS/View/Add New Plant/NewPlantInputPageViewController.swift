//
//  NewPlantInputPageViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/17/21.
//

import UIKit

class NewPlantInputPageViewController: UIPageViewController, UIPageViewControllerDelegate, Storyboarded {
    
    var coordinator: NewPlantInputPageViewCoordinator?
    
//    private(set) lazy var orderedInputViewControllers: [UIViewController] = {
//        return [self.makeNewPlantInputViewController(type: .Name, placeholderText: "placeholder 1", instructionText: "instruction 1"),
//                self.makeNewPlantInputViewController(type: .Location, placeholderText: "placeholder 2", instructionText: "instruction 2"),
//                self.makeNewPlantInputViewController(type: .DatePicker, placeholderText: "placeholder 3", instructionText: "instruction 3"),
//                self.makeNewPlantInputViewController(type: .Image, placeholderText: "placeholder 4", instructionText: "instruction 4")]
//    }()
    
    
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
    
    private func makeNewPlantInputViewController(type: InputType, placeholderText: String = "", instructionText: String) -> UIViewController {
        let vc = NewPlantInputViewController(nibName: "NewPlantInputViewController", bundle: nil)
        vc.loadViewIfNeeded() // without this, IBOutlets are nil
//        vc.parentPageVC = self
        
        switch type {
        case .Name:
            vc.inputTextField.isHidden = false
        case .Location:
            vc.inputTextField.isHidden = false
        case .DatePicker:
            vc.inputTextField.isHidden = false
        case .Image:
            vc.addImageButton.isHidden = false // show button
        }
        
        vc.inputTextField.placeholder = placeholderText
        vc.instructionLabel.text = instructionText

        return vc
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
