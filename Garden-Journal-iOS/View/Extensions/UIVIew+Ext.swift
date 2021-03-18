//
//  UIVIew+Ext.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 3/14/21.
//

import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
