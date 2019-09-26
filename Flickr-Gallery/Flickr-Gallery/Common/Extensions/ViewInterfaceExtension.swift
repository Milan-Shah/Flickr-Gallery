//
//  ViewInterfaceExtension.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import Foundation
import UIKit
import MKProgress

extension ViewInterface where Self: UIViewController {
    
    func hideProgressBar() {
        MKProgress.hide()
    }
    
    func showProgressBar() {
        MKProgress.config.circleBorderWidth = 1.0
        MKProgress.config.circleBorderColor = .gunmetal
        MKProgress.config.logoImage = UIImage(named: "placeholder")
        MKProgress.config.logoImageSize = CGSize(width: 60, height: 60)
        MKProgress.show()
    }
}

