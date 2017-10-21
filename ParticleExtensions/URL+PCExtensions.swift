//
//  URL+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/18/17.
//  Copyright © 2017 Rocco Del Priore. All rights reserved.
//

import Foundation

extension URL {
    public func appendingWebComponent(component: String) -> URL? {
        //Ensure starting character is not '/'
        var mutableComponent = component
        if mutableComponent.first == "/" {
            mutableComponent.remove(at: mutableComponent.startIndex)
        }
        
        //Ensure trailing character is '/'
        var mutableRoot = self.absoluteString
        if mutableRoot.last != "/" {
            mutableRoot.append("/")
        }
        
        //Concatenate Strings
        let urlString = mutableRoot.appending(mutableComponent)
        
        return URL(string: urlString)
    }
    public mutating func appendWebComponent(component: String) {
        var mutableComponent = component
        
        if self.absoluteString.last == "/" {
            //Ensure starting character is not '/'
            if mutableComponent.first == "/" {
                mutableComponent.remove(at: mutableComponent.startIndex)
            }
        }
        else {
            //Ensure starting character is '/'
            if mutableComponent.first != "/" {
                mutableComponent.insert("/", at: mutableComponent.startIndex)
            }
        }
        
        //Append Component
        self.appendPathComponent(mutableComponent)
    }
    public mutating func setParameters(parameters: Dictionary<String, String>) {
        guard
            let rootString = self.absoluteString.components(separatedBy: "?").first,
            let rootURL = URL(string: rootString) else {
                return
        }
        
        var queryItems = [URLQueryItem]()
        for key in parameters.keys {
            let authComponent = URLQueryItem(name: key, value: parameters[key])
            queryItems.append(authComponent)
        }
        
        let components = NSURLComponents(url: rootURL, resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems
        
        guard let url = components?.url else {
            return
        }
        
        self = url
    }
}

extension URLSession {
    public static let defaultSession: URLSession = {
        return URLSession(configuration: URLSessionConfiguration.default)
    }()
}
