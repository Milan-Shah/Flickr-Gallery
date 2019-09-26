//
//  UIFontExtension.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import Foundation
import UIKit

extension UIFont {
    
    /* Created Font Extension to centralize a place for us to fetch Fonts from within an entire application. */
    
    enum FontWeight: String {
        case ms100 = "MuseoSans-100"
        case ms100Italic = "MuseoSans-100-Italic"
        case ms300 = "MuseoSans-300"
        case ms300Italic = "MuseoSans-300-Italic"
        case ms500 = "MuseoSans-500"
        case ms500Italic = "MuseoSans-500-Italic"
        case ms700 = "MuseoSans-700"
        case ms700Italic = "MuseoSans-700-Italic"
        case ms900 = "MuseoSans-900"
        case ms900Italic = "MuseoSans-900-Italic"
    }
    
    class func museoSans(_ weight: FontWeight, size: CGFloat) -> UIFont {
        
        // Force casting because it is necessary as expected.
        return UIFont(name: weight.rawValue, size: size)!
    }
}
