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
    var viewModel: NewPlantFormTableViewViewModel! {
        didSet {
            fillUI()
        }
    }
    private var inputIndex: Int!
    var locations: [String]?
    @IBOutlet var addImageButton: UIButton!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var instructionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    private func fillUI() {
        
//        viewModel.locationsList?.bindAndFire{ [unowned self] in
//            self.locations = $0
//        }
        
        let inputDef = viewModel.inputList[inputIndex]
        switch inputDef.inputType {
        case .Name:
            self.inputTextField.isHidden = false
        case .Location:
            self.inputTextField.isHidden = false
        case .DatePicker:
            self.inputTextField.isHidden = false
            inputTextField.setInputViewDatePicker(target: self, selector: #selector(tapDoneDatePicker))
        case .Image:
            self.addImageButton.isHidden = false // show button
        }
        inputTextField.placeholder = inputDef.placeholderText
        instructionLabel.text = inputDef.instructionText
    }
    
    func setInputIndex(_ i: Int) {
        inputIndex = i
    }
    
    @IBAction func addPhotoButtonPressed(_ sender: Any) {
//        if addImageButton.isHidden == false {
//            let imageOptionController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
//            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
//                self.coordinator?.addNewPhoto(from: .Camera)
//            }
//            let photoAlbumAction = UIAlertAction(title: "Photos Album", style: .default) { (action) in
//                self.coordinator?.addNewPhoto(from: .Album)
//            }
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//            imageOptionController.addAction(cameraAction)
//            imageOptionController.addAction(photoAlbumAction)
//            imageOptionController.addAction(cancelAction)
//
//            parentViewController?.present(imageOptionController, animated: true, completion: nil)
//        }
        imagePicker?.present(from: self.view)
        
    }
    
    @objc func tapDoneDatePicker() {
        if let datePicker = inputTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            self.inputTextField.text = dateFormatter.string(from: datePicker.date)
        }
        inputTextField.resignFirstResponder()
    }
}

extension NewPlantInputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.resignFirstResponder()
        coordinator?.nextPage(sender: self)
        return true
    }
}

extension NewPlantInputViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        
    }
}

//extension NewPlantInputViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1 //the number of picker view columns
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//
//    }
//}
