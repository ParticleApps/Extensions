//
//  UIScrollView+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/7/18.
//  Copyright © 2018 Rocco Del Priore. All rights reserved.
//

import UIKit
import Foundation

extension UIScrollView {
    var numberOfHorizontalPages: Int {
        set {}
        get { return Int(floor(self.contentSize.width/self.frame.width)) }
    }
    var numberOfVerticalPages: Int {
        set {}
        get { return Int(floor(self.contentSize.height/self.frame.height)) }
    }
    var currentHorizontalPage: Int {
        set {}
        get { return Int(floor(self.contentOffset.x/self.frame.width)) }
    }
    var currentVerticalPage: Int {
        set {}
        get { return Int(floor(self.contentOffset.y/self.frame.height)) }
    }
}
