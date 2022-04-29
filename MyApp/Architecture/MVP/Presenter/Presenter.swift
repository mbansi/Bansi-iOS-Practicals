//
//  Presenter.swift
//  MyApp
//
//  Created by Bansi Mamtora on 13/04/22.
//

import Foundation
import UIKit

protocol PresenterView {
    func update(color: UIColor)
}

class Presenter {
    
    //MARK: - Variables
    var view: PresenterView?
    var timesTapped = 0
    
    init(with view: PresenterView) {
        self.view = view
    }
    
    //MARK: - Functions
    func tapOnClick() {
        timesTapped += 1
        if (timesTapped % 2 == 0) {
            self.view?.update(color: getColor(color: .red))
        }
        else {
            self.view?.update(color: getColor(color: .blue))
        }
    }
    
    func getColor(color: Colors) -> UIColor {
        switch color {
        case .red:
            return UIColor.red
        case .blue:
            return UIColor.blue
        }
    }
}
