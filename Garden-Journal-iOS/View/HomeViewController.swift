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

    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.coordinator = coordinator
    }


}
