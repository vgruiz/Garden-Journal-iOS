//
//  UpdateCollectionViewCell.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/7/21.
//

import UIKit

class UpdateCollectionViewCell: UICollectionViewCell {

    var viewModel: UpdateTableViewCellViewModelForUpdate! {
        didSet {
            fillUI()
        }
    }
    
    let cornerRadius: CGFloat = 8.0
    
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        imageView.layer.cornerRadius = cornerRadius
    }
    
    private func fillUI() {
        viewModel.imageData?.bindAndFire{ [unowned self] in
            self.imageView.image = UIImage(data: $0)
        }
    }

}
