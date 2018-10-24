//
//  MenuNotesListCell.swift
//  FunlifeNotes
//
//  Created by Admin on 8/10/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit

enum TypeMenuCellNoteList {
    case alarm
    case security
    case edit
    case delete
}

protocol MenuNotesListCellDelegate: class {
    func selectTypeMenuCell(type: TypeMenuCellNoteList)
}

class MenuNotesListCellView: UIView {
    weak var delegate: MenuNotesListCellDelegate?
    @IBOutlet weak var title_menu_cell: UILabel!
    @IBOutlet weak var ic_menu_cell: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("MenuNotesListCell", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
