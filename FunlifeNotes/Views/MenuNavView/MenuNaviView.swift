//
//  MenuNavView.swift
//  FunlifeNotes
//
//  Created by Admin on 8/7/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import Foundation
import UIKit

class MenuNaviView: UIView, MenuNaviDelegate {
    
    func selectTypeMenuTop(type: MenuTop) {
       delegate?.selectTypeMenuTop(type: type)
    }
    weak var delegate: MenuNaviDelegate?
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var itemNavSearch: ItemNavView!
    @IBOutlet weak var itemNavHome: ItemNavView!
    @IBOutlet weak var itemNavCreate: ItemNavView!
    @IBOutlet weak var itemNavAlarm: ItemNavView!
    
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
       itemNavHome.initItem(image: #imageLiteral(resourceName: "menu_nav_home"))
       itemNavHome.delegate = self
       itemNavSearch.initItem(image: #imageLiteral(resourceName: "menu_nav_search"))
       itemNavSearch.delegate = self
       itemNavCreate.initItem(image: #imageLiteral(resourceName: "icons8-create-48"), item: .create)
       itemNavCreate.delegate = self
       itemNavAlarm.initItem(image: #imageLiteral(resourceName: "menu_nav_alarm"),item: .search)
       itemNavAlarm.delegate = self
    }
}
