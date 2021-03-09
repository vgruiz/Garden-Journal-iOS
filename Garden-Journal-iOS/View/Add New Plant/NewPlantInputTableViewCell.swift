//
//  NewPlantInputTableViewCell.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/2/21.
//

import UIKit

class NewPlantInputTableViewCell: UITableViewCell {
    
    //TODO: Set the cells height to be basically as large as the phone is
    // Then set the spacing so that the rest of the cell's elements appear
    // in their proper locations with the keyboard considered.

    private(set) static var cellHeight: CGFloat = 700.0 // TODO: Will be set dynamically
    
    var viewModel: NewPlantInputTableViewCellViewModel! {
        didSet {
            fillUI()
        }
    }
    
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var informationLabel: UILabel!
    @IBOutlet var addImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: NewPlantInputTableViewCell.cellHeight)
        ])
    }
    
    @IBAction func addImageButtonPressed(_ sender: Any) {
        print("Add image button pressed.")
    }
    
    private func fillUI() {

        viewModel.locationsList
        
        switch viewModel.newPlantInput.inputType {
        case .Name:
            addImageButton.isHidden = true
            inputTextField.isHidden = false
        case .DatePicker:
            addImageButton.isHidden = true
            inputTextField.isHidden = false // this will be updated to date picker scroll wheel
        case .Image:
            addImageButton.isHidden = false
            inputTextField.isHidden = true
            inputTextField.placeholder = ""
        case .Location
            
        }

        informationLabel.text = viewModel.instructionText
        inputTextField.placeholder = viewModel.placeholderText
    }
}
