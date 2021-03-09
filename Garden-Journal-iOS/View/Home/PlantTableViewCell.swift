//
//  PlantTableViewCell.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/21/21.
//

import UIKit

class PlantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var plantCellImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let cellHeight: CGFloat = 136.0
    
    var viewModel: PlantTableViewCellViewModelFromPlant! {
        didSet {
            fillUI()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        plantCellImageView.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: PlantTableViewCell.cellHeight)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func fillUI() {
        viewModel.plantImageData.bindAndFire { [unowned self] in
            self.plantCellImageView?.image = UIImage(data: $0)
        }
        
        viewModel.plantName.bindAndFire { [unowned self] in
            self.nameLabel?.text = $0
        }
    }
}
