//
//  UITextFieldExtension.swift
//  Flickr-Gallery
//
//  Created by Milan Shah on 9/25/19.
//

import UIKit

class SearchTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        /* Giving a 25 px left padding on the frame origin x */
        return CGRect(x: frame.origin.x + 5, y: bounds.origin.y, width: bounds.width - 35, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        /* Giving a 25 px left padding on the frame origin x */
        return CGRect(x: frame.origin.x + 5, y: bounds.origin.y, width: bounds.width - 35, height: bounds.height)
    }
}

extension UITextField {
    
    /* TextField with a left image view */
    func searchTextField(_ textField: UITextField = SearchTextField() ) -> UITextField {
        
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 10.0
        textField.font = .museoSans(.ms300, size: 16.0)
        textField.textColor = .gunmetal
        textField.placeholder = "Search..."
        
        let leftImageView = UIImageView(frame: CGRect(x: 10, y: -1, width: 16, height: 16))
        leftImageView.image = UIImage(named: "search")
        
        let leftViewForTextField = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        leftViewForTextField.addSubview(leftImageView)
        textField.leftView = leftViewForTextField
        textField.leftViewMode = .always
        
        return textField
        
    }
    
}
