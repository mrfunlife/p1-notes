//
//  NotesListCell.swift
//  FunlifeNotes
//
//  Created by Admin on 8/8/18.
//  Copyright © 2018 FunLife. All rights reserved.
//

import UIKit

class NotesListCell: UITableViewCell {

    @IBOutlet weak var imgColorItem: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var noteObj: NotesObj! {
         didSet {
            var image = #imageLiteral(resourceName: "ic_color_item")
            switch noteObj.colorItem {
            case .blue:
                image = image.maskWithColor(color: #colorLiteral(red: 0.2823529412, green: 0.4117647059, blue: 0.9098039216, alpha: 1))
                break
            case .red:
                image = image.maskWithColor(color: #colorLiteral(red: 0.8941176471, green: 0.2901960784, blue: 0.4117647059, alpha: 1))
                break
            case .green:
                image = image.maskWithColor(color: #colorLiteral(red: 0.5333333333, green: 0.8039215686, blue: 0.3058823529, alpha: 1))
                break
            case .orange:
                image = image.maskWithColor(color: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
                break
            }
            imgColorItem.image = image
        }
    }
    
}
