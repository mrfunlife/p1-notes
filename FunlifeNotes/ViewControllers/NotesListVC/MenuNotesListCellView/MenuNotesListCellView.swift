//
//  MenuNotesListCell.swift
//  FunlifeNotes
//
//  Created by Admin on 8/10/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit

enum TypeMenuCellNoteList {
    case watch
    case edit
    case delete
    case security
}

protocol MenuNotesListCellDelegate: class {
    func selectTypeMenuCell(type: TypeMenuCellNoteList)
}

class MenuNotesListCellView: UIView {
    weak var delegate: MenuNotesListCellDelegate?
    var type = TypeMenuCellNoteList.watch
    @IBOutlet weak var title_menu_cell: UILabel!
    @IBOutlet weak var ic_menu_cell: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    
    func initView(title: String, ic: UIImage) {
        title_menu_cell.text = title
        ic_menu_cell.image = ic
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectMenuCell))
        gesture.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gesture)
    }
    
    @objc func selectMenuCell(){
        self.pulsate()
        switch self.tag {
        case 31:
            type = .watch
            break
        case 32:
            type = .edit
            break
        case 33:
            type = .delete
            break
        case 34:
            type = .security
            break
        default:
            break
        }
        delegate?.selectTypeMenuCell(type: type)
    }
    
    func setHidden(isHidden: Bool) {
        title_menu_cell.isHidden = isHidden
        ic_menu_cell.isHidden = isHidden
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
        Bundle.main.loadNibNamed("MenuNotesListCellView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
