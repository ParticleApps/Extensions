//
//  IndexPath+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/7/17.
//  Copyright © 2017 Rocco Del Priore. All rights reserved.
//

import Foundation

extension IndexPath {
    public func stringValue() -> String {
        return String(format: "(s: %i, r: %i)", self.section, self.row)
    }
}
