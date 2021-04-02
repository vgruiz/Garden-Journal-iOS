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
            self.backgroundColor = MyColor.disabledGray
        } else {
            self.backgroundColor = MyColor.sharedMyColor.activeColorSceheme.color1
        }
        self.isEnabled = isValid
    }
}

