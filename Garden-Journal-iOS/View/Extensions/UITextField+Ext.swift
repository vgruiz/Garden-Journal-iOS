//
//  UITextField+Ext.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/10/21.
//

import Foundation
import UIKit

extension UITextField {
        
    func setInputView(as pickerView: UIPickerView?, withAccessory accessory: UIView) {
        self.resignFirstResponder()
        self.inputView = nil
        self.inputAccessoryView = nil
        if let pickerView = pickerView {
            pickerView.selectRow(0, inComponent: 0, animated: false)
            self.inputView = pickerView
        }
        self.inputAccessoryView = accessory
        self.becomeFirstResponder()
    }
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = .date
        
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.sizeToFit()
        }
        self.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}
