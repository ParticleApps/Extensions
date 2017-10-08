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
        let mutableString = NSMutableString()
        for string in strings {
            mutableString.append(string)
        }
        return mutableString as String
    }
}
