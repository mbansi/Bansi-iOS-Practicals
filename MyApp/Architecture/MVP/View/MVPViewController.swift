//
//  MVPViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 13/04/22.
//

import UIKit

class MVPViewController: UIViewController {
    
    //MARK: - Variables
    lazy var presenter = Presenter(with: self)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func tapAction(_ sender: UIButton) {
        presenter.tapOnClick()
    }
}

//MARK: - Extension
extension MVPViewController: PresenterView {
    func update(color: UIColor) {
        self.view.backgroundColor = color
    }
}
