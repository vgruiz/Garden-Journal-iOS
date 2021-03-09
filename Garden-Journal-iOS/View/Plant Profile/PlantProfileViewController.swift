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
    @IBOutlet var tmpLabel: UILabel!
    
    var viewModel: PlantProfileViewModel? {
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
            self.tmpLabel.text = $0
        }
        
    }

}
