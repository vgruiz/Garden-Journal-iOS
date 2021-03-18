//
//  AddNewPlantViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/1/21.
//

import UIKit

class AddNewPlantViewController: UIViewController, Storyboarded {
    
    weak var coordinator: Coordinator?
    var cellCoordinators: [NewPlantInputTableViewCellCoordinator]?
    @IBOutlet var newPlantFormTableView: NewPlantFormTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        newPlantFormTableView.cellCoordinators = self.cellCoordinators!
    }

    
}
