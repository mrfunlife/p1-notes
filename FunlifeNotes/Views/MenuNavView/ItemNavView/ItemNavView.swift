//
//  ItemNavView.swift
//  FunlifeNotes
//
//  Created by Admin on 8/7/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit

enum NavItem {
    case HOME
    case SEARCH
    case ALARM
    case CREATE
    case NONE
}


class ItemNavView: UIView {
     @IBOutlet weak var contentView: UIView!
     @IBOutlet weak var iconItem: UIImageView!
     @IBOutlet weak var csWidth: NSLayoutConstraint!
    func setImageItem(image: UIImage, item: NavItem = .NONE) {
        let img = image.maskWithColor(color: .white)
        self.iconItem.image = img
        if item == .CREATE {
            csWidth.constant = 22
            self.layoutIfNeeded()
        }
        if item == .ALARM {
            csWidth.constant = 19
            self.layoutIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("ItemNavView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
