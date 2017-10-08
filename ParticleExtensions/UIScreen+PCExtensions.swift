//
//  UIScreen+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/7/17.
//  Copyright © 2017 Rocco Del Priore. All rights reserved.
//

import Foundation

extension UIScreen {
    class func height() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    class func width() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}
