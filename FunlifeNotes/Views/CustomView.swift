//
//  CodeView.swift
//  FunlifeNotes
//
//  Created by Admin on 7/28/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import Foundation
import UIKit


protocol NumberPadViewDelegate: class {
    func selectNumberPadView(tag: Int)
}
class CodeView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        self.layer.borderColor = #colorLiteral(red: 0.4, green: 0.4745098039, blue: 0.4705882353, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = self.bounds.height / 2
    }
}


class NumberPadView: UIView {
    weak var delegate: NumberPadViewDelegate?
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        self.layer.borderColor = #colorLiteral(red: 0.4274509804, green: 0.7450980392, blue: 0.6745098039, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = self.bounds.height / 2
    }
    
    func addAnimation(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tabView))
        gesture.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gesture)
    }
    
    @objc func tabView(){
        delegate?.selectNumberPadView(tag: self.tag)
    }
}

class NumberPadLabel: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.font = self.font.withSize(22)
     
    }
       
}
