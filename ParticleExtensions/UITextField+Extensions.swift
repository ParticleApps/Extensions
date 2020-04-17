//
//  UITextField+Extensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 4/16/20.
//  Copyright © 2020 Rocco Del Priore. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    public func updatedString(range: NSRange, replacementString: String) -> String {
        if let text = self.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: replacementString)
            return updatedText
        }
        
        return self.text ?? ""
    }
}
