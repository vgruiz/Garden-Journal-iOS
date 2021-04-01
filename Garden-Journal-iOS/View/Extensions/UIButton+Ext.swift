//
//  UIButton+Ext.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/29/21.
//

import Foundation
import UIKit

extension UIButton {
    func setEnabledWithAppearance(isValid: Bool) {
        if !isValid {
            self.backgroundColor = UIColor.systemGray
        } else {
            //self.backgroundColor = App.greenButtonColor or something like that
            self.backgroundColor = UIColor.init(red: 6, green: 94, blue: 24)
        }
        self.isEnabled = isValid
    }
}

