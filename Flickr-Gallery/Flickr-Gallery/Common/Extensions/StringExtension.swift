//
//  StringExtension.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import UIKit

extension NSAttributedString {
    
    func attributedText (text: String, font: UIFont, textColor: UIColor) -> NSAttributedString {
        let attributedText = NSAttributedString(string: text, attributes: [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: textColor])
        return attributedText
    }
}

extension String {
    
    func toCGFloat() -> CGFloat {
        return CGFloat(truncating: NumberFormatter().number(from: self)!)
    }
}
