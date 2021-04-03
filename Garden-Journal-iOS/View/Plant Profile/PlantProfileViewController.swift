//
//  PlantProfileViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/27/21.
//

import UIKit

class PlantProfileViewController: UIViewController, Storyboarded {

    weak var coordinator: Coordinator?
    var plantIndexPath: IndexPath?
    
    var pageViewViewControllers = [UIViewController]()
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var pinnedNotesTextView: UITextView!
    @IBOutlet var updatesEmbeddedPageViewController: UIView!
    
    
    var viewModel: PlantProfileViewModelForPlant? {
        didSet {
            fillUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillUI()
    }
    
    fileprivate func fillUI() {
        if !isViewLoaded {
            return
        }
        
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.name.bindAndFire { [unowned self] in
            self.nameLabel.text = $0
        }
        
        
//        viewModel.location.bindAndFire{ [unowned self] in
//            self.locationLabel.text = $0
//        }
        
//        viewModel.adoptionDate.bindAndFire{ [unowned self] in
//            self.adoptionDateLabelOrSomething.text = $0.text
//        }
  
        viewModel.profileImageData?.bindAndFire { [unowned self]  in
            self.profileImageView.image = UIImage(data: $0)
        }
    }
    
    func setChildViewControllers( children: [UIViewController]) {
        pageViewViewControllers = children
    }

}
