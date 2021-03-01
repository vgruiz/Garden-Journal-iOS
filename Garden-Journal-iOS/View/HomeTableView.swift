//
//  HomeTableView.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/21/21.
//

import UIKit

class HomeTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    weak var coordinator: MainCoordinator?
    var viewModel: HomeTableViewViewModel!
    
    required init?(coder: NSCoder) {
        viewModel = HomeTableViewViewModel()
        super.init(coder: coder)
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "PlantTableViewCell", bundle: nil), forCellReuseIdentifier: "PlantTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.plantList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "PlantTableViewCell", for: indexPath) as! PlantTableViewCell
        
        if let plant = viewModel.plantList?[indexPath.row].value {
            cell.viewModel = PlantTableViewCellViewModelFromPlant(from: plant)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print( viewModel.plantList?[indexPath.row].value.name ?? "no name I guess" )

        coordinator?.goToPlantProfile(forPlantIndexPath: indexPath)
        
//        if let plant = viewModel.plantList?[indexPath.row] {
//            coordinator?.goToPlantProfile( for: plant )
//        }
//        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
