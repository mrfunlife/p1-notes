//
//  UILabel+Ex.swift
//  feliznet
//
//  Created by LocDG on 5/2/18.
//  Copyright © 2018 mmw. All rights reserved.
//

import UIKit
extension UILabel {
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0, alignment: NSTextAlignment = .center ) {
        
        guard let labelText = self.text else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.alignment = alignment
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        // Line spacing attribute
        attributedString.addAttributes([NSAttributedStringKey.paragraphStyle: paragraphStyle], range:NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
}
