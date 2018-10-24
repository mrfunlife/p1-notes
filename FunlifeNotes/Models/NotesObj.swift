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

struct ContentNote {
    var number: Int = 0
    var text: String = ""
    var isReminder: Bool = false
    var color: UIColor = .white
    var dateReminder: Int64 = 0
    var listImage:[String] = []
    
    init() {}
    init(number: Int, text: String, isReminder: Bool, color: UIColor, dateReminder: Int64) {
        self.number = number
        self.text = text
        self.isReminder = isReminder
        self.color = color
        self.dateReminder = dateReminder
    }
}


struct NotesObj {
    var id: Int = 0
    var title: String = ""
    var listContentNote: [ContentNote] = []
    var dateUpdate: Int64 = 0
    var isReminder: Bool = false
    var isPrivate: Bool = false
    var password: String = ""
    var colorItem: ColorItem = .blue
    var isOpenDetail: Bool = false
    
    init() {}
    
    init(id: Int, title: String, dateCreate: Int64, isImpotant: Bool, isReminder: Bool, isPrivate: Bool, password: String) {
        self.id = id
        self.title = title
        self.dateUpdate = dateCreate
        self.isReminder = isReminder
        self.isPrivate = isPrivate
        self.password = password
    }
}
