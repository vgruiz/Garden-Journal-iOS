//
//  UpdateTableViewCell.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 4/2/21.
//

import UIKit

class UpdateTableViewCell: UITableViewCell {
    
    var viewModel: UpdateTableViewCellViewModelForUpdate! {
        didSet {
            fillUI()
        }
    }

    let edgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    let cellCornerRadius: CGFloat = 10.0
    let imageCornerRadius: CGFloat = 8.0
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var noteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func fillUI() {
//        backgroundColor = MyColor.sharedMyColor.activeColorSceheme.color3
//        frame.inset(by: edgeInsets)
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.layer.masksToBounds = true
        containerView.backgroundColor = MyColor.sharedMyColor.activeColorSceheme.color3
        containerView.frame.inset(by: edgeInsets)
        containerView.layer.cornerRadius = cellCornerRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.layoutMargins = edgeInsets
        
        viewModel.date.bindAndFire { [unowned self] in
            let formatter = DateFormatter()
            formatter.dateStyle = DateFormatter.Style.medium
            dateLabel.text = formatter.string(from: $0)
        }
        
        viewModel.imageData?.bindAndFire{ [unowned self] in
            cellImageView.image = UIImage(data: $0)
        }
        cellImageView.layer.cornerRadius = imageCornerRadius
        
        viewModel.note.bindAndFire { [unowned self] in
            noteLabel.text = $0
            noteLabel.sizeToFit()
        }
    }
    
}
