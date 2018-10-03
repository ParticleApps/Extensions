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

extension URLRequest {
    public func performForJSONDictionary(success: @escaping (Dictionary<String, Any>) -> Void, failure: @escaping (Error?) -> Void?) {
        let task = URLSession.defaultSession.dataTask(with: self) { (data, response, error) in
            if let _ = data {
                do {
                    if let json  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as? Dictionary<String, Any> {
                        success(json)
                    }
                    else {
                        failure(error)
                    }
                } catch let error as NSError {
                    failure(error)
                }
            }
            else {
                failure(error)
            }
        }
        task.resume()
    }
    public func performForJSONArray(success: @escaping (Array<Any>) -> Void, failure: @escaping (Error?) -> Void?) {
        let task = URLSession.defaultSession.dataTask(with: self) { (data, response, error) in
            if let _ = data {
                do {
                    if let json  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as? Array<Any> {
                        success(json)
                    }
                    else {
                        failure(error)
                    }
                } catch let error as NSError {
                    failure(error)
                }
            }
            else {
                failure(error)
            }
        }
        task.resume()
    }
}
