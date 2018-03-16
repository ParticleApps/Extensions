//
//  UIScreen+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/7/17.
//  Copyright © 2017 Rocco Del Priore. All rights reserved.
//

import Foundation

//TODO: Expand this to include all possible cases
public enum ScreenType: Int {
    case iPhoneOriginal = 0
    case iPhoneSE = 1
    case iPhone = 2
    case iPhonePlus = 3
    case iPhoneX = 4
    case iPad = 5
    case iPadPro = 6
    case iPadProLarge = 7
}

public extension UIScreen {
    class func height() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    class func width() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    class func type() -> ScreenType {
        if UI_USER_INTERFACE_IDIOM() == .phone {
            switch UIScreen.height() {
            case ...480 : return .iPhoneOriginal
            case ...568 : return .iPhoneSE
            case ...667 : return .iPhone
            case ...736 : return .iPhonePlus
            case ...812 : return .iPhoneX
            default:
                return .iPad
            }
        }
        else if UI_USER_INTERFACE_IDIOM() == .pad {
            switch UIScreen.height() {
            case ...1024 : return .iPad
            case ...1112 : return .iPadPro
            case ...1366 : return .iPadProLarge
            default:
                return .iPhone
            }
        }
        return .iPhone
    }
}

