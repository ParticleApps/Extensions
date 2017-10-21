//
//  NSURLRequest+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/21/17.
//  Copyright © 2017 Rocco Del Priore. All rights reserved.
//

import Foundation

extension NSMutableURLRequest {
    public func setJSONBody(json: Dictionary<String, Any?>) {
        do {
            let body = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            
            self.setValue("application/json", forHTTPHeaderField: "content-type")
            self.setValue("cache-control", forHTTPHeaderField: "no-cache")
            self.httpBody = body
        } catch {
            print(error.localizedDescription)
        }
    }
}
