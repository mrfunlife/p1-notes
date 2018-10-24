//
//  GlobalVariable.swift
//  FunlifeNotes
//
//  Created by Admin on 7/30/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import Foundation

// A delay function
func delay(seconds: Double, completion: @escaping ()-> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}


var isLargeTitleNav = false


//MARK: StoryBoard
let SETTING_STORYBOARD = "SettingStoryboard"
let DETAIL_STORYBOARD = "NotesDetailStoryBoard"
let MAIN_STORYBOARD = "Main"
let CREATE_STORYBOARD = "NotesCreateStoryBoard"



