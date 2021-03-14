//
//  NewPlantFormTableView.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/2/21.
//

import UIKit

class NewPlantFormTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    weak var coordinator: MainCoordinator?
    var viewModel = NewPlantFormTableViewViewModel()
    //register new cell and get them to appear
 
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "NewPlantInputTableViewCell", bundle: nil), forCellReuseIdentifier: "NewPlantInputTableViewCell")
        separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "NewPlantInputTableViewCell") as! NewPlantInputTableViewCell
        
        cell.viewModel = NewPlantInputTableViewCellViewModelForInput(viewModel.inputList[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.inputList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NewPlantInputTableViewCell.cellHeight
    }
}
