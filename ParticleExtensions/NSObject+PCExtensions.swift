//
//  NSObject+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/7/18.
//  Copyright © 2018 Rocco Del Priore. All rights reserved.
//

import Foundation

protocol PropertyStoring {
    
    associatedtype T
    
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T
}

extension PropertyStoring {
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T {
        guard let value = objc_getAssociatedObject(self, key) as? T else {
            return defaultValue
        }
        return value
    }
}
