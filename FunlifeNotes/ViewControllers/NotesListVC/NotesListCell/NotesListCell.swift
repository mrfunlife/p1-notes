//
//  NotesListCell.swift
//  FunlifeNotes
//
//  Created by Admin on 8/8/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit

protocol NotesListCellDelegate: class {
    func setActionFromCell(type: TypeMenuCellNoteList, indexPath: IndexPath)
}

class NotesListCell: UITableViewCell, MenuNotesListCellDelegate {
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var menuWatch: MenuNotesListCellView!
    @IBOutlet weak var menuDelete: MenuNotesListCellView!
    @IBOutlet weak var menuEdit: MenuNotesListCellView!
    @IBOutlet weak var menuSecurity: MenuNotesListCellView!
    @IBOutlet weak var imgColorItem: UIImageView!
    weak var delegate: NotesListCellDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initMeuCell(color: UIColor){
        menuWatch.initView(title: "Watch", ic: #imageLiteral(resourceName: "ic_watch").maskWithColor(color: color))
        let img = #imageLiteral(resourceName: "ic_edit").maskWithColor(color: #colorLiteral(red: 0.8182779948, green: 0.2784313858, blue: 0.400000006, alpha: 1))
        menuEdit.initView(title: "Edit", ic: img)
        menuDelete.initView(title: "Delete", ic: #imageLiteral(resourceName: "ic_delete"))
        menuSecurity.initView(title: "*******", ic: #imageLiteral(resourceName: "ic_security"))
        
        menuWatch.delegate = self
        menuEdit.delegate = self
        menuDelete.delegate = self
        menuSecurity.delegate = self
    }

    var noteObj: NotesObj! {
         didSet {
            let image = #imageLiteral(resourceName: "ic_color_item")
            var color = UIColor.white
            switch noteObj.colorItem {
            case .blue:
                color = #colorLiteral(red: 0.2823529412, green: 0.4117647059, blue: 0.9098039216, alpha: 1)
                break
            case .red:
                color = #colorLiteral(red: 0.8941176471, green: 0.2901960784, blue: 0.4117647059, alpha: 1)
                break
            case .green:
                color = #colorLiteral(red: 0.5333333333, green: 0.8039215686, blue: 0.3058823529, alpha: 1)
                break
            case .orange:
                color = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
                break
            }
            imgColorItem.image = image.maskWithColor(color: color)
            initMeuCell(color: color)
            menuSecurity.setHidden(isHidden: !noteObj.isPrivate)
            viewMenu.isHidden = !noteObj.isOpenDetail
        }
    }
    
    func selectTypeMenuCell(type: TypeMenuCellNoteList) {
        guard let index = indexPath else { return  }
        delegate?.setActionFromCell(type: type, indexPath: index)
    }
    
}
