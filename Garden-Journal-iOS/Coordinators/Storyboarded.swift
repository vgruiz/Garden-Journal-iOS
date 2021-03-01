//
//  Storyboarded.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/27/21.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storybord = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storybord.instantiateViewController(identifier: id) as! Self
    }
}
