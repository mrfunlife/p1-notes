//
//  MenuBottomBarView.swift
//  FunlifeNotes
//
//  Created by Admin on 7/29/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit

enum MenuBottom {
    case open
    case home
    case web
    case share
    case settings
}

protocol MenuBottomBarViewDelegate: class {
    func selectMenuBottomBar(typeMenu: MenuBottom)
}

protocol MenuViewDelegate: class {
    func selectMenuView(typeMenu: MenuBottom)
}

class MenuView: UIView {
    weak var delegate: MenuViewDelegate?
    var typeMenu = MenuBottom.open
    
    func addAnimation(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectMenuBottom))
        gesture.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gesture)
    }
    
    @objc func selectMenuBottom() {
        self.pulsate()
        switch self.tag {
        case 11:
            typeMenu = .open
            break
        case 12:
            typeMenu = .home
            break
        case 13:
            typeMenu = .web
            break
        case 14:
            typeMenu = .share
            break
        case 15:
            typeMenu = .settings
            break
        default:
            break
        }
        self.delegate?.selectMenuView(typeMenu: typeMenu)
    }
    
}

class MenuBottomBarView: UIView, MenuViewDelegate {
   
    weak var delegate: MenuBottomBarViewDelegate?
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var menu_open: MenuView!
    @IBOutlet weak var menu_home: MenuView!
    @IBOutlet weak var menu_web: MenuView!
    @IBOutlet weak var menu_share: MenuView!
    @IBOutlet weak var menu_settings: MenuView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func addAnimation(){
        let listView: [MenuView] = [menu_open,menu_home,menu_web,menu_share,menu_settings]
        for item in listView {
            item.delegate = self
            item.addAnimation()
        }
    }
    
    func selectMenuView(typeMenu: MenuBottom) {
        delegate?.selectMenuBottomBar(typeMenu: typeMenu)
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("MenuBottomBarView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
