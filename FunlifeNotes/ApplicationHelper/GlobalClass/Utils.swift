//
//  Utils.swift
//  FunlifeNotes
//
//  Created by Admin on 7/28/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import Foundation

class Utils {

    static func setStringToDefaults (value: Bool, key: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    
    static func getStringToDefaults(key: String, defaultValue: Bool) -> Bool {
        if let value: Bool = UserDefaults.standard.object(forKey: key) as? Bool {
            return value
        }
        return defaultValue
    }
}
