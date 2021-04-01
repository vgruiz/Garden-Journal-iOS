//
//  Validator.swift
//  Garden Journal
//
//  Created by Victor Ruiz on 1/16/21.
//  Copyright © 2021 Victor Ruiz. All rights reserved.
//

import Foundation
import UIKit

class Validator {
    
    func isAlphanumeric(_ value: String) -> Bool {
        return !value.isEmpty && value.range(of: "[^a-zA-Z0-9\\s,]", options: String.CompareOptions.regularExpression) == nil
    }
    
//    func isImageSet(imageView: UIImageView) -> Bool {
//        return imageView.image?.toData != UIImage().defaultPlantImage?.toData
//    }
    
}
