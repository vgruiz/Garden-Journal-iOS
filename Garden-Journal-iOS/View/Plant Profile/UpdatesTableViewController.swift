//
//  UpdatesTableViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/2/21.
//

import UIKit

class UpdatesTableViewController: UITableViewController, Storyboarded {
    static let CELL_NIB_NAME = "UpdateTableViewCell"
    
    var coordinator: PlantProfileCoordinator?
    var viewModel: UpdatesTableViewViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        //viewModel = UpdatesTableViewControllerViewModel
        super.init(coder: coder)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: UpdatesTableViewController.CELL_NIB_NAME, bundle: nil), forCellReuseIdentifier: UpdatesTableViewController.CELL_NIB_NAME)
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return viewModel.updates.count
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UpdatesTableViewController.CELL_NIB_NAME, for: indexPath) as! UpdateTableViewCell
        
//        if let update = viewModel.updates?[indexPath.row].value {
//            cell.noteLabel.text = update.note
//        }

        return cell
    }
}
