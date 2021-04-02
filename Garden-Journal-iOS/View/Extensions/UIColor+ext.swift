//
//  UIColor+ext.swift
//  Garden Journal
//
//  Created by Victor Ruiz on 1/24/21.
//  Copyright © 2021 Victor Ruiz. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    
}

final class MyColor {
    static let sharedMyColor = MyColor()
    var sharedInstanceExists = false
    static let disabledGray = UIColor.lightGray
    
    var activeColorSceheme: ColorScheme {
        get {
            return ColorScheme0()
        }
    }
    
    private init() {
        sharedInstanceExists = true
    }
    
    
    private class ColorScheme0: ColorScheme {
        // https://colorpalettes.net/color-palette-3790/

        var color0: UIColor
        var color1: UIColor
        var color2: UIColor
        var color3: UIColor
        var color4: UIColor
        
        init() {
            color0 = UIColor(netHex: 0x55b8ae)
            color1 = UIColor(netHex: 0x065e18)
            color2 = UIColor(netHex: 0x83ad21)
            color3 = UIColor(netHex: 0xe8db9d)
            color4 = UIColor(netHex: 0xf3f8f7)
        }
    }
}

protocol ColorScheme {
    var color0: UIColor { get }
    var color1: UIColor { get }
    var color2: UIColor { get }
    var color3: UIColor { get }
    var color4: UIColor { get }
}
