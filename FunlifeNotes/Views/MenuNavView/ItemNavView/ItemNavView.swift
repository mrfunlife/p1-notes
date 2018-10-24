//
//  ItemNavView.swift
//  FunlifeNotes
//
//  Created by Admin on 8/7/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit

enum MenuTop {
    case home
    case search
    case alarm
    case create
    case none
}

protocol MenuNaviDelegate: class {
    func selectTypeMenuTop(type: MenuTop)
}

class ItemNavView: UIView {
    weak var delegate: MenuNaviDelegate?
    var typeMenu = MenuTop.none
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var iconItem: UIImageView!
    @IBOutlet weak var csWidth: NSLayoutConstraint!
    
    
    func initItem(image: UIImage, item: MenuTop = .none) {
        let img = image.maskWithColor(color: .white)
        self.iconItem.image = img
        if item == .create {
            csWidth.constant = 22
            self.layoutIfNeeded()
        }
        if item == .search {
            csWidth.constant = 19
            self.layoutIfNeeded()
        }
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectMenuTop))
        gesture.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gesture)
    }
    
    @objc func selectMenuTop() {
        self.pulsate()
        switch self.tag {
        case 21:
            typeMenu = .home
            break
        case 22:
            typeMenu = .search
            break
        case 23:
            typeMenu = .alarm
            break
        case 24:
            typeMenu = .create
            break
        default:
            break
        }
        self.delegate?.selectTypeMenuTop(type: typeMenu)
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
