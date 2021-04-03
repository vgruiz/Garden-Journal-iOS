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

    @IBOutlet var noteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func fillUI() {
        viewModel.note.bindAndFire { [unowned self] in
            self.noteLabel.text = $0
        }
    }
    
}
