//
//  String+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/7/17.
//  Copyright © 2017 Rocco Del Priore. All rights reserved.
//

import Foundation

extension NSAttributedString {
    public func heightForContrainedWidth(width: CGFloat) -> CGFloat {
        let context = NSStringDrawingContext()
        let boundingBox = self.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, context: context).size
       return boundingBox.height
    }
    public func widthForContrainedHeight(height: CGFloat) -> CGFloat {
        let context = NSStringDrawingContext()
        let boundingBox = self.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height), options: NSStringDrawingOptions.usesLineFragmentOrigin, context: context).size
        return boundingBox.width
    }
}

extension String {
    public func stringByAppending(strings: [String]) -> String {
        let mutableString = NSMutableString(string: self)
        for string in strings {
            mutableString.append(string)
        }
        return mutableString as String
    }
    public func onlyNumericalValues() -> String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    public func onlyAlphabeticalValues() -> String {
        return components(separatedBy: CharacterSet.letters.inverted).joined()
    }
    public func withoutNumericalValues() -> String {
        return components(separatedBy: CharacterSet.decimalDigits).joined()
    }
    public func withoutAlphabeticalValues() -> String {
        return components(separatedBy: CharacterSet.letters).joined()
    }
    public func asPhoneNumber(spaces: Bool = false) -> String {
        let number = self.onlyNumericalValues()
        if number.count == 7 {
            let firstThreeDigits = number.prefix(3)
            let lastFourDigits = number.dropFirst(3)
            if spaces {
                return String.init(format: "%@ - %@", firstThreeDigits as CVarArg, lastFourDigits as CVarArg)
            }
            return String.init(format: "%@-%@", firstThreeDigits as CVarArg, lastFourDigits as CVarArg)
        }
        else if number.count == 10 {
            let firstThreeDigits = number.prefix(3)
            let middleThreeDigits = number[number.index(number.startIndex, offsetBy: 3)..<number.index(number.endIndex, offsetBy: -4)]
            let lastFourDigits = number.dropFirst(6)
            if spaces {
                return String.init(format: "(%@) %@ - %@", firstThreeDigits as CVarArg, middleThreeDigits as CVarArg, lastFourDigits as CVarArg)
            }
            return String.init(format: "(%@)%@-%@", firstThreeDigits as CVarArg, middleThreeDigits as CVarArg, lastFourDigits as CVarArg)
        }
        else if number.count > 10 {
            let prefixCount = number.count-10
            let firstNDigits = number.prefix(prefixCount)
            let firstThreeDigits = number[number.index(number.startIndex, offsetBy: prefixCount)..<number.index(number.endIndex, offsetBy: -7)]
            let middleThreeDigits = number[number.index(number.startIndex, offsetBy: prefixCount+3)..<number.index(number.endIndex, offsetBy: -4)]
            let lastFourDigits = number.dropFirst(number.count-4)
            if spaces {
                return String.init(format: "+%@ (%@) %@ - %@", firstNDigits as CVarArg, firstThreeDigits as CVarArg, middleThreeDigits as CVarArg, lastFourDigits as CVarArg)
            }
            return String.init(format: "+%@(%@)%@-%@", firstNDigits as CVarArg, firstThreeDigits as CVarArg, middleThreeDigits as CVarArg, lastFourDigits as CVarArg)
        }
        return number
    }
}
