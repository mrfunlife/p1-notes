//
//  PasscodeVC.swift
//  FunlifeNotes
//
//  Created by Admin on 7/28/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit

func Dlog(msg: Any){
    print(msg)
}

class PasscodeVC: BaseViewController, NumberPadViewDelegate {

     @IBOutlet weak var codeView1: CodeView!
     @IBOutlet weak var codeView2: CodeView!
     @IBOutlet weak var codeView3: CodeView!
     @IBOutlet weak var codeView4: CodeView!
    
     @IBOutlet weak var number0: NumberPadView!
     @IBOutlet weak var number1: NumberPadView!
     @IBOutlet weak var number2: NumberPadView!
     @IBOutlet weak var number3: NumberPadView!
     @IBOutlet weak var number4: NumberPadView!
     @IBOutlet weak var number5: NumberPadView!
     @IBOutlet weak var number6: NumberPadView!
     @IBOutlet weak var number7: NumberPadView!
     @IBOutlet weak var number8: NumberPadView!
     @IBOutlet weak var number9: NumberPadView!
    
    var validCode: [Int] = []
    var codeViews: [CodeView] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        codeViews = [codeView1, codeView2, codeView3, codeView4]
        addDelegate()
    }
    
    @IBAction func deleteNumber(_ sender: Any) {
        if 0 < validCode.count  && validCode.count <= 4 {
            codeViews[validCode.count-1].backgroundColor = .clear
            validCode.removeLast()
            Dlog(msg: validCode)
        }
    }
    
    func addDelegate(){
        let subviewList: [NumberPadView] = [number0,number1,number2,number3
        ,number4,number5,number6,number7,number8,number9]
        for subview in subviewList {
               subview.delegate = self
               subview.addAnimation()
        }
    }
    
    func selectNumberPadView(tag: Int) {
        if validCode.count < 4 {
            validCode.append(tag)
            for i in 0...(validCode.count - 1) {
                codeViews[i].backgroundColor = #colorLiteral(red: 0.4, green: 0.4745098039, blue: 0.4705882353, alpha: 1)
            }
        }
        if validCode.count == 4 {
            let vc =  MyNavigationController.fromStoryboard("Main")
            vc.modalTransitionStyle = .flipHorizontal
            self.present(vc, animated: true, completion: nil)
        }
    }

}
