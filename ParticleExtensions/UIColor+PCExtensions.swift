//
//  UIColor+Hex.swift
//  ParticleExtensions
//
//  Created by Stephen Silber on 2/21/17.
//  Copyright © 2017 particle Co. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(hex: String) {
        self.init(hex: Int32(hex, radix:16) ?? Int32("00000000", radix: 16)!, alpha: 1)
    }
    public convenience init(hex: Int32, alpha: CGFloat) {
        let r = CGFloat(hex >> 16 & 0xFF) / 255
        let g = CGFloat(hex >> 8 & 0xFF) / 255
        let b = CGFloat(hex & 0xFF) / 255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
