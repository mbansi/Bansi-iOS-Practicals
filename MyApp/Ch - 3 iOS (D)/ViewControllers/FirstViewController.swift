//
//  FirstViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 10/03/22.
//

import UIKit

protocol DataPassingDelegate {
    func getData(_ value: String)
}

class FirstViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tfMessage: UITextField!
    
    //MARK: - Variables
    var coordinator: FirstCoordinator?
    var delegate: DataPassingDelegate?
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
    }
    
    //MARK: - Actions
    @IBAction func passToSecond(sender: UIButton) {
        guard let message = tfMessage.text else {
            return
        }
        coordinator?.gotoSecond(message)
    }

    @IBAction func passToHome(sender: UIButton){
        guard let message = tfMessage.text else {
            return
        }
        delegate?.getData(message)
        coordinator?.finish()
    }
       
    @IBAction func gotoVC4(_ sender: UIButton) {
        coordinator?.gotoVC4()
    }
 }
    

