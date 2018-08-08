//
//  UIDevice+Extensions.swift
//  AutoLayoutStackViewByCode
//
//  Created by Admin on 11/18/17.
//  Copyright © 2017 FunLife. All rights reserved.
//


import UIKit

extension UIDevice {
    
    static func checkIphoneX(normal: CGFloat, iphoneX: CGFloat) -> CGFloat {
        switch UIScreen.main.nativeBounds.height {
        case 2436:
            return iphoneX
        default:
            return normal
        }
    }
    
    static func checkIphone(iphone5: CGFloat, normal: CGFloat, iphoneX: CGFloat) -> CGFloat {
        switch UIScreen.main.nativeBounds.height {
        case 1136:
            return iphone5
        case 2436:
            return iphoneX
        default:
            return normal
        }
    }
    
    static func setSize(iphone: CGFloat, ipad: CGFloat) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return iphone
        case .pad:
            return ipad
        default:
            return 0
        }
    }
    static func setSizeIphoneIpad(iphone5: CGFloat, ipad: CGFloat, normal: CGFloat) -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return ipad
        }else{
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                return iphone5
            default:
                return normal
            }
        }
    }
}
