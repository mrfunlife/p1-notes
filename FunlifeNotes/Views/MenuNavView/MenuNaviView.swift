//
//  MenuNavView.swift
//  FunlifeNotes
//
//  Created by Admin on 8/7/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import Foundation
import UIKit

class MenuNaviView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var itemNavLeftTwo: ItemNavView!
    @IBOutlet weak var itemNavLeftOne: ItemNavView!
    @IBOutlet weak var itemNavRightOne: ItemNavView!
    @IBOutlet weak var itemNavRighTwo: ItemNavView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("MenuNaviView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setImageItem() {
       itemNavLeftOne.setImageItem(image: #imageLiteral(resourceName: "menu_nav_home"))
       itemNavLeftTwo.setImageItem(image: #imageLiteral(resourceName: "menu_nav_search"))
       itemNavRightOne.setImageItem(image: #imageLiteral(resourceName: "icons8-create-48"), item: .CREATE)
       itemNavRighTwo.setImageItem(image: #imageLiteral(resourceName: "menu_nav_alarm"),item: .ALARM)
    }
}
