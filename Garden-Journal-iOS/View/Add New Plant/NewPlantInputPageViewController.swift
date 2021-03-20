//
//  NewPlantInputPageViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/17/21.
//

import UIKit

class NewPlantInputPageViewController: UIPageViewController, UIPageViewControllerDelegate, Storyboarded {
    
    var coordinator: NewPlantInputCoordinator?
    
    private(set) lazy var orderedInputViewControllers: [UIViewController] = {
        return [self.makeNewPlantInputViewController(type: .Name, placeholderText: "placeholder 1", instructionText: "instruction 1"),
                self.makeNewPlantInputViewController(type: .Location, placeholderText: "placeholder 2", instructionText: "instruction 2"),
                self.makeNewPlantInputViewController(type: .DatePicker, placeholderText: "placeholder 3", instructionText: "instruction 3"),
                self.makeNewPlantInputViewController(type: .Image, placeholderText: "placeholder 4", instructionText: "instruction 4")]
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedInputViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func makeNewPlantInputViewController(type: InputType, placeholderText: String = "", instructionText: String) -> UIViewController {
        let vc = NewPlantInputViewController(nibName: "NewPlantInputViewController", bundle: nil)
        vc.loadViewIfNeeded() // without this, IBOutlets are nil
        
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
    
}

extension NewPlantInputPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedInputViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedInputViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedInputViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedInputViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedInputViewControllers.count != nextIndex else {
            return nil
        }
        
        guard orderedInputViewControllers.count > nextIndex else {
            return nil
        }
        
        return orderedInputViewControllers[nextIndex]
    }
}
