//
//  UITableView+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/7/17.
//  Copyright © 2017 Rocco Del Priore. All rights reserved.
//

import Foundation

extension UITableView {
    public func registerClass(anyClass: AnyClass, cellType: Int) {
        self.register(anyClass, forCellReuseIdentifier: String(format: "%li", cellType))
    }
}
