//
//  Date+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/7/17.
//  Copyright © 2017 Rocco Del Priore. All rights reserved.
//

import Foundation

extension DateFormatter {
    public convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
    public convenience init(style: DateFormatter.Style) {
        self.init()
        self.dateStyle = style
        self.timeStyle = style
    }
    public convenience init(dateStyle: DateFormatter.Style) {
        self.init()
        self.dateStyle = dateStyle
    }
    public convenience init(timeStyle: DateFormatter.Style) {
        self.init()
        self.timeStyle = timeStyle
    }
}

extension Date {
    public func stringValue() -> String {
        return DateFormatter(dateFormat: "MMM d, yyyy, h:mm a").string(from: self)
    }
}
