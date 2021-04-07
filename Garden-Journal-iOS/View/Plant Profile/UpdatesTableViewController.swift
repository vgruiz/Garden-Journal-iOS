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
        guard let vm = viewModel else {
            fatalError()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: UpdatesTableViewController.CELL_NIB_NAME, bundle: nil), forCellReuseIdentifier: UpdatesTableViewController.CELL_NIB_NAME)
        tableView.separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let n = viewModel.updatesList!.count
        return n
        //        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UpdatesTableViewController.CELL_NIB_NAME, for: indexPath) as! UpdateTableViewCell
        
        if let update = viewModel.updatesList?[indexPath.row].value {
//            cell.noteLabel.text = "TEST TEST"
            cell.viewModel = UpdateTableViewCellViewModelForUpdate(for: update)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 50
    }
    
}
