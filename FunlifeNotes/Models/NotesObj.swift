//
//  NotesObj.swift
//  FunlifeNotes
//
//  Created by Admin on 7/30/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import Foundation
import UIKit

enum ColorItem {
    case blue
    case red
    case green
    case orange
}

struct NotesObj {
    var id: Int = 0
    var title: String = ""
    var description: String = ""
    var dateCreate: Int64 = 0
    var isImpotant: Bool = false
    var isReminder: Bool = false
    var dateReminder: Int64 = 0
    var isPrivate: Bool = false
    var password: String = ""
    var colorItem: ColorItem = .blue
    
    init() {}
    
    init(id: Int, title: String, description: String, dateCreate: Int64, isImpotant: Bool, isReminder: Bool,dateReminder:Int64, isPrivate: Bool, password: String) {
        self.id = id
        self.title = title
        self.description = description
        self.dateCreate = dateCreate
        self.isImpotant = isImpotant
        self.isReminder = isReminder
        self.dateReminder = dateReminder
        self.isPrivate = isPrivate
        self.password = password
    }
}
