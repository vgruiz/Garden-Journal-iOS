//
//  ViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/21/21.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {
    
    @IBOutlet var homeTableView: HomeTableView!
    weak var coordinator: MainCoordinator?
//    weak override var navigationController: UINavigationController?
//    @IBOutlet var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.coordinator = coordinator
        self.title = "Home"
        
        let addPlantButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPlantButtonPressed))
        navigationItem.rightBarButtonItem = addPlantButton
    }
    
    @objc func addPlantButtonPressed() {
        coordinator?.addNewPlant()
    }

}
