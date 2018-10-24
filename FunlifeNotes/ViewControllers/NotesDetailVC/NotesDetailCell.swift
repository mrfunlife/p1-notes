//
//  NotesDetailCell.swift
//  FunlifeNotes
//
//  Created by Admin on 9/22/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit

class NotesDetailCell: UITableViewCell {
    @IBOutlet weak var viewContentNote: ViewContentNote!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         viewContentNote.initCollectionView()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
