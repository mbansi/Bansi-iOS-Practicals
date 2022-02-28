//
//  CustomTextField.swift
//  MyApp
//
//  Created by Bansi Mamtora on 01/03/22.
//

import UIKit

class CustomTextField: UITextField {
    @IBInspectable var padding: Double {
         get {
           return Double(self.layer.cornerRadius)
         }set {
           self.layer.cornerRadius = CGFloat(newValue)
         }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: .zero, left: padding, bottom: .zero, right: .zero)
        return bounds.inset(by: padding)
        
    }

}
