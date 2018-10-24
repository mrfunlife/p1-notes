//
//  NotesDetailVC.swift
//  FunlifeNotes
//
//  Created by Admin on 8/15/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit
import BGTableViewRowActionWithImage

class NotesDetailVC: UIViewController {
    @IBOutlet weak var csLeadingTableView: NSLayoutConstraint!
    
    @IBOutlet weak var icAlarm: UIImageView!
    @IBOutlet weak var icSercutity: UIImageView!
    @IBOutlet weak var popUpView: BorderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var viewEditNote: ViewEditNoteSlide!
    var isShowEdit: Bool = false
    var HEIGHT_ROW:CGFloat = 90
    @IBAction func btnClose(_ sender: Any) {
        animateOut()
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        if editButton.imageView?.image == #imageLiteral(resourceName: "ic_done") {
            UIView.animate(withDuration: 0.3, animations: {
                self.csLeadingTableView.constant = 0
                self.view.layoutIfNeeded()
            })
        }
        changeStatusShowEdit()
        tableView.setEditing(isShowEdit, animated: true)
    }
    
    func changeStatusShowEdit() {
        isShowEdit = !isShowEdit
        editButton.setImage(isShowEdit ? #imageLiteral(resourceName: "ic_done") : #imageLiteral(resourceName: "ic_detail_edit"), for: .normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundAlpha()
        popUpView.alpha = 0
        initTableView()
        viewEditNote.initCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateIn()
    }
    
    func animateIn(){
        popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popUpView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.popUpView.alpha = 1
            self.popUpView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popUpView.alpha = 0
        }) {(success: Bool) in
            self.dismiss(animated: false, completion: nil)
        }
    }
}

extension NotesDetailVC: UITableViewDataSource, UITableViewDelegate {
    
    func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let imageAlarm = #imageLiteral(resourceName: "ic_alarm_cell")
        let imageSecurity = #imageLiteral(resourceName: "ic_security")
        icAlarm.image = imageAlarm
        icSercutity.image = imageSecurity
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: NotesDetailCell =  tableView.dequeueReusableCell(withIdentifier: "NotesDetailCell", for: indexPath) as? NotesDetailCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
      
        let edit = BGTableViewRowActionWithImage.rowAction(with: .normal, title: "Edit",titleColor: .gray, backgroundColor: .white, image: #imageLiteral(resourceName: "ic_edit_white").maskWithColor(color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)), forCellHeight: UInt(HEIGHT_ROW)) { (action, index) in

            UIView.animate(withDuration: 0.3, animations: {
                self.csLeadingTableView.constant = -self.tableView.frame.width
                self.view.layoutIfNeeded()
            })

            print("Edit")
        }
        


        let delete = BGTableViewRowActionWithImage.rowAction(with: .normal, title: "Delete",titleColor: .gray, backgroundColor: .white, image: #imageLiteral(resourceName: "ic_delete_white").maskWithColor(color: .red), forCellHeight: UInt(HEIGHT_ROW)) { (action, index) in
            print("Delete")
        }
        return [delete!, edit!]
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
   
   
    }
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
         isShowEdit = true
         editButton.setImage(#imageLiteral(resourceName: "ic_done"), for: .normal)
    }
    
}
