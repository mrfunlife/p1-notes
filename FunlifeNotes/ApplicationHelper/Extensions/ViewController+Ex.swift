//
//  ViewController+Ex.swift
//  FunlifeNotes
//
//  Created by Admin on 7/28/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import Foundation
import UIKit
protocol ResponseUIViewController {}

extension ResponseUIViewController where Self: UIViewController {
    
    static func fromStoryboard(_ storyboardName: String, withIdentifier: String? = nil) -> Self {
        return Self.fromStoryboard(self, storyboardName: storyboardName, withIdentifier: withIdentifier)
    }
    
    fileprivate static func fromStoryboard<T: UIViewController>(_ type: T.Type, storyboardName: String, withIdentifier: String?) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let identifier = withIdentifier == nil ? T().className : withIdentifier!
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}

extension UIViewController: ResponseUIViewController {
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last ?? ""
    }
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
