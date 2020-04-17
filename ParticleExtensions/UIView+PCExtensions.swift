//
//  UIView+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/7/17.
//  Copyright © 2017 Rocco Del Priore. All rights reserved.
//

import Foundation

extension UIStackView {
    public func addArrangedSubviews(views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}

extension UIView {
    public func addSubview(views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    public func findAndResignFirstResponder() -> Bool {
        if self.isFirstResponder {
            self.resignFirstResponder()
            return true
        }
        for view in self.subviews {
            if view.findAndResignFirstResponder() {
                return true
            }
        }
        return false
    }
    
    public func roundCorners(radius: CGFloat = 5.0) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func layoutSubviews(animationDuration: TimeInterval) {
        UIView.animate(withDuration: animationDuration) {
            self.layoutSubviews()
        }
    }
}
