//
//  Helper.swift
//  MyApp
//
//  Created by Bansi Mamtora on 28/04/22.
//

import Foundation
import UIKit


func showAlert(_ message: String,_ view: UIViewController){
        let alert = UIAlertController(title: "Alert", message:   message , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    view.present(alert, animated: true, completion: nil)
}

extension UIViewController {
   
    func dismissKeyboard(_ view: UIView) {
        let gesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(gesture)
    }
}
