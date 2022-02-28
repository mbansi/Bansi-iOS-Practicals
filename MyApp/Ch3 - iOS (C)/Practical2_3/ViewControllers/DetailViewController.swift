//
//  DetailViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 07/03/22.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgCricketer: UIImageView!
    
    //MARK: - Variables
    var name = ""
    var image = ""
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = name
        imgCricketer.image = UIImage(named: image)
        // Do any additional setup after loading the view.
    }

    //MARK: - Actions
    @IBAction func changeLayout(_ sender: UISwitch) {
        if sender.isOn {
            stackView.axis = .horizontal
        }
        else {
            stackView.axis = .vertical
        }
    }
    
}
