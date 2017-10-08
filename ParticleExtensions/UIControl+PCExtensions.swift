//
//  UIControl+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/7/17.
//  Copyright © 2017 Rocco Del Priore. All rights reserved.
//

import Foundation

extension UIControl {
    public func removeAllTargets() {
        self.removeTarget(nil, action: nil, for: .allEvents)
    }
    
}
