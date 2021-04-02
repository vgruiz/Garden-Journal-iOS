//
//  NewPlantInputPageViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/17/21.
//

import UIKit

class NewPlantInputPageViewController: UIPageViewController, UIPageViewControllerDelegate, Storyboarded {
    
    var coordinator: NewPlantInputPageViewCoordinator?
    var viewModel: NewPlantInputPageViewModel? {
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
            orderedInputViewControllers![i].viewModel = NewPlantInputViewModelForInput(inputList[i])
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

    func isInputValid() -> Bool {
        // required: name, date of adoption, location
        var isValid = true
        for vc in orderedInputViewControllers! {
            if (vc.viewModel.type != .Image) {
                isValid = isValid && vc.isInputValid()
            }
        }
        return isValid
    }
    
    func createNewPlant() {
        guard let pages = orderedInputViewControllers else {
            fatalError("Fatal error accessing orderedInputViewControllers")
        }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium

        // guard let for required fields
        guard let _name = pages[0].inputTextField.text,
              let _date = formatter.date(from: pages[1].inputTextField.text! ),
              let _location = pages[2].inputTextField.text
        else {
            fatalError("Fatal error while creating a new plant.")
        }
        
        let _data = pages[3].imageView.image?.pngData() ?? nil
        
        if let index = viewModel?.savePlant(name: _name, adoptionDate: _date, location: _location, imageData: _data, pinnedNotes: nil) {

            coordinator?.finishAddingPlant(index: index)
            
        }
        
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
