//
//  UIColor+Hex.swift
//  ParticleExtensions
//
//  Created by Stephen Silber on 2/21/17.
//  Copyright © 2017 particle Co. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(hex: Int32) {
        self.init(hex: hex, alpha: 1)
    }
    public convenience init(hex: Int32, alpha: CGFloat) {
        let r = CGFloat(hex >> 16 & 0xFF) / 255
        let g = CGFloat(hex >> 8 & 0xFF) / 255
        let b = CGFloat(hex & 0xFF) / 255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
