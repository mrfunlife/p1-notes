//
//  HomeViewController.swift
//  FunlifeNotes
//
//  Created by Admin on 7/29/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, MenuBottomBarViewDelegate {

    fileprivate let SEGUE_CONTAINER_VIEW = "SEGUE_CONTAINER_VIEW"

    @IBOutlet weak var myMenuNav: MenuNaviView!
    @IBOutlet weak var myMenuBottom: MenuBottomBarView!
    @IBOutlet weak var cotainerView: UIView!
    @IBOutlet weak var csHeightBottomMenu: NSLayoutConstraint!
    var myNaviController: MyNavigationController?
    var isOpenBottomMenu = false
    var isEnableSettingVC = false

    override func viewDidLoad() {
        super.viewDidLoad()
        myMenuBottom.delegate = self
        myMenuBottom.addAnimation()
        myMenuNav.setImageItem()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == SEGUE_CONTAINER_VIEW){
            if let embedVC = segue.destination as? MyNavigationController {
                self.myNaviController = embedVC
            }
        }
    }

    func addIconTitle() -> UIView{
        let image : UIImage = UIImage(named: "menu_nav_logo.png")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    func selectMenuBottomBar(typeMenu: MenuBottom) {
        switch typeMenu {
        case .open:
            openMenuBottom()
            break
        case .home:
            break
        case .web:
            break
        case .share:
            break
        case .settings:
            openSettingVC()
            break
        }
    }
    
    func pushToVCFromHome(vc: UIViewController){
        myNaviController?.pushViewController(vc, animated: true)
    }
    
    func openSettingVC(){
        let vc = SettingsVC.fromStoryboard(SETTING_STORYBOARD)
        isLargeTitleNav = !isLargeTitleNav
        isEnableSettingVC = !isEnableSettingVC
        if isEnableSettingVC{
            myNaviController?.popToRootViewController(animated: true)
        }else{
            pushToVCFromHome(vc: vc)
        }
    }
    
    func openMenuBottom(){
        if isOpenBottomMenu == false {
            UIView.animate(withDuration: 0.2, animations: {
                self.csHeightBottomMenu.constant = 50
                self.view.layoutIfNeeded()
                self.isOpenBottomMenu = true
            })
        }else {
            UIView.animate(withDuration: 0.2, animations: {
                self.csHeightBottomMenu.constant = 35
                self.view.layoutIfNeeded()
                self.isOpenBottomMenu = false
            })
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
