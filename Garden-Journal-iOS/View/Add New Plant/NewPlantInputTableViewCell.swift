//
//  NewPlantInputTableViewCell.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/2/21.
//

import UIKit

class NewPlantInputTableViewCell: UITableViewCell {
    
    var imagePicker: ImagePicker?
    weak var coordinator: NewPlantInputTableViewCellCoordinator?
    var viewModel: NewPlantInputTableViewCellViewModel! {
        didSet {
            fillUI()
        }
    }
    
    //TODO: Set the cells height to be basically as large as the phone is
    // Then set the spacing so that the rest of the cell's elements appear
    // in their proper locations with the keyboard considered.

    var screenWidth: CGFloat?
    private(set) static var cellHeight: CGFloat = 700.0 // TODO: Will be set dynamically
    
    var locations: [String]?
    
    lazy var locationsPickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth!, height: 216))
    
    lazy var locationsPickerAccessoryView: UIView = {
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth!, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let addLocationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(switchToKeyboardWithAccessoryView))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDoneOnLocationPicker))
        toolBar.setItems([addLocationButton, flexible, barButton], animated: false)
        return toolBar
    }()
    
    lazy var keyboardAccessoryView: UIView = {
        let accessoryView = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth!, height: 44.0))
        let switchToListButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-30"), style: .plain, target: self, action: #selector(switchToPickerViewInput))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDoneOnLocationPicker))
        accessoryView.items = [switchToListButton, flexible, doneButton]
        accessoryView.sizeToFit()
        return accessoryView
    }()
    
    
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var informationLabel: UILabel!
    @IBOutlet var addImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        screenWidth = UIScreen.main.bounds.width
        if let parent = parentViewController {
            imagePicker = ImagePicker(presentationController: parent, delegate: self)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: NewPlantInputTableViewCell.cellHeight)
        ])
    }
    
    @IBAction func addImageButtonPressed(_ sender: Any) {
        print("Add image button pressed.")
//        let imageOptionController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
//        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
//            self.coordinator?.addNewPhoto(from: .Camera)
//        }
//        let photoAlbumAction = UIAlertAction(title: "Photos Album", style: .default) { (action) in
//            self.coordinator?.addNewPhoto(from: .Album)
//        }
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        imageOptionController.addAction(cameraAction)
//        imageOptionController.addAction(photoAlbumAction)
//        imageOptionController.addAction(cancelAction)
//
//        parentViewController?.present(imageOptionController, animated: true, completion: nil)
        guard let parent = parentViewController else {
            return
        }
//        let imagePicker = ImagePicker(presentationController: parent, delegate: self)
        imagePicker?.present(from: parent.view)
        
    }
    
    private func fillUI() {
        

        viewModel.locationsList?.bindAndFire{ [unowned self] in
            self.locations = $0
        }
        
        switch viewModel.type {
        case .Name:
            addImageButton.isHidden = true
            inputTextField.isHidden = false
        case .DatePicker:
            addImageButton.isHidden = true
            inputTextField.isHidden = false
            inputTextField.placeholder = viewModel.placeholderText
            inputTextField.setInputViewDatePicker(target: self, selector: #selector(tapDoneOnDatePicker))
        case .Image:
            addImageButton.isHidden = false
            inputTextField.isHidden = true
            inputTextField.placeholder = ""
        case .Location:
            addImageButton.isHidden = true
            inputTextField.isHidden = false
            inputTextField.placeholder = viewModel.placeholderText
            inputTextField.inputView = locationsPickerView
            inputTextField.inputAccessoryView = locationsPickerAccessoryView
            locationsPickerView.delegate = self
        }

        informationLabel.text = viewModel.instructionText
        inputTextField.placeholder = viewModel.placeholderText
    }
    
    @objc func tapDoneOnDatePicker() {
        if let datePicker = inputTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            self.inputTextField.text = dateFormatter.string(from: datePicker.date)
        }
        inputTextField.resignFirstResponder()
    }
        
    @objc func tapDoneOnLocationPicker() {
        // TODO: Input validation if it's a custom input
        inputTextField.resignFirstResponder()
    }
    
    @objc func switchToKeyboardWithAccessoryView() {
        inputTextField.setInputView(as: nil, withAccessory: keyboardAccessoryView)
    }
    
    @objc func switchToPickerViewInput() {
        inputTextField.setInputView(as: locationsPickerView, withAccessory: locationsPickerAccessoryView)
    }
}

// MARK: UIPickerView Delegate and Data Source
extension NewPlantInputTableViewCell : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  1 // basically the number of individual columns in the picker view
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (locations?.count ?? 0 ) + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return ""
        } else {
            return locations?[row - 1]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row > 0 {    // the first row is meant to be blank and not reference a real location
            inputTextField.text = locations![row - 1]
        }
    }
}

extension NewPlantInputTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if viewModel.type == .Name {
//            coordinator.goToAdoptionDateCell()
        }
    }
}

extension NewPlantInputTableViewCell: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        print("got an image")
    }
}
