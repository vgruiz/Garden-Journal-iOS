//
//  UpdatesCollectionViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/2/21.
//

import UIKit

private let CELL_NIB_NAME = "UpdateCollectionViewCell"

class UpdatesCollectionViewController: UICollectionViewController, UpdatesPageSubView, Storyboarded {
    var viewModel: UpdatesTableViewViewModel!
    
    func reload() {
        collectionView.reloadData()
    }
    
    var coordinator: PlantProfileCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: CELL_NIB_NAME, bundle: nil), forCellWithReuseIdentifier: CELL_NIB_NAME)
        // Do any additional setup after loading the view.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.updatesList!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_NIB_NAME, for: indexPath) as! UpdateCollectionViewCell
        
        if let update = viewModel.updatesList?[indexPath.row].value {
            cell.viewModel = UpdateTableViewCellViewModelForUpdate(for: update)
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}
