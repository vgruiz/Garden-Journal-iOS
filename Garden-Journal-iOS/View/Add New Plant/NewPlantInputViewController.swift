//
//  NewPlantInputViewController.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/17/21.
//

import UIKit

class NewPlantInputViewController: UIViewController, Storyboarded {

    var imagePicker: ImagePicker?
    var coordinator: NewPlantInputPageViewCoordinator?
    var viewModel: NewPlantInputViewModelForInput! {
        didSet {
            fillUI()
        }
    }
    private var inputIndex: Int!
    var locations: [String]?
    @IBOutlet var addImageButton: UIButton!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var instructionLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var addImageSecondaryButton: UIButton!
    @IBOutlet var instructionBottomToSuperviewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var finishButton: UIButton!
    
    var screenWidth: CGFloat?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = UIScreen.main.bounds.width
        inputTextField.delegate = self
        imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        finishButton.setEnabledWithAppearance( isValid: coordinator!.validateInputs() )
    }
    
    private func fillUI() {
        
        viewModel.locationsList?.bindAndFire{ [unowned self] in
            self.locations = $0
        }
        
        switch viewModel.type {
        case .Name:
            inputTextField.isHidden = false
        case .Location:
            inputTextField.isHidden = false
            inputTextField.inputView = locationsPickerView
            inputTextField.inputAccessoryView = locationsPickerAccessoryView
            locationsPickerView.delegate = self
        case .DatePicker:
            inputTextField.isHidden = false
            inputTextField.setInputViewDatePicker(target: self, selector: #selector(tapDoneDatePicker))
        case .Image:
            addImageButton.isHidden = false // show button
            finishButton.isHidden = false
        }
        inputTextField.placeholder = viewModel.placeholderText
        instructionLabel.text = viewModel.instructionText
    }
    
    func setInputIndex(_ i: Int) {
        inputIndex = i
    }
    
    @IBAction func addPhotoButtonPressed(_ sender: Any) {
        imagePicker?.present(from: self.view)
    }
    
    @IBAction func finishButtonPressed(_ sender: Any) {
        if coordinator!.validateInputs() {
            coordinator?.createNewPlantProfile()
        } else {
            print("there is a problem with the input")
            // TODO: - bad input user experience
        }
    }
    
    @objc func tapDoneDatePicker() {
        if let datePicker = inputTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            self.inputTextField.text = dateFormatter.string(from: datePicker.date)
        }
        inputTextField.resignFirstResponder()
        coordinator?.nextPage(sender: self)
    }
    
    @objc func tapDoneOnLocationPicker() {
        // TODO: Input validation if it's a custom input
        inputTextField.resignFirstResponder()
        coordinator?.nextPage(sender: self)
    }
    
    @objc func switchToKeyboardWithAccessoryView() {
        inputTextField.setInputView(as: nil, withAccessory: keyboardAccessoryView)
    }
    
    @objc func switchToPickerViewInput() {
        inputTextField.setInputView(as: locationsPickerView, withAccessory: locationsPickerAccessoryView)
    }
    
    func isInputValid() -> Bool {
        let validator = Validator()
        switch viewModel.type {
        case .Name, .Location, .DatePicker:
            return validator.isAlphanumeric(inputTextField.text ?? "")
        case .Image:
            // Image is not required
            return true
        }
    }
}

extension NewPlantInputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.resignFirstResponder()
        coordinator?.nextPage(sender: self)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        instructionBottomToSuperviewBottomConstraint.constant = 350
    }
}

extension NewPlantInputViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.imageView.image = image
        self.addImageButton.isHidden = true
        self.addImageSecondaryButton.isHidden = false
    }
}

// MARK: UIPickerView Delegate and Data Source
extension NewPlantInputViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  1 // basically the number of individual columns in the picker view
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (locations?.count ?? 0 ) + 1
    }
    
    func pickerView(_ pickerView: UIPickerView,  titleForRow row: Int, forComponent component: Int) -> String? {
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

