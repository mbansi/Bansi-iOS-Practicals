//
//  MainComponentsViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 04/03/22.
//

import UIKit

class MainComponentsViewController: UIViewController {

    //MARK: - Outlets
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func openTask2(_ sender: UIButton) {
        if let tabBar = UIStoryboard(name: "Practical2_3", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController {
            navigationController?.pushViewController(tabBar, animated: true)
        }
    }
    
    @IBAction func openTableView(_ sender: UIButton) {
        if let table = UIStoryboard(name: "Practical1", bundle: nil).instantiateViewController(withIdentifier: "TableViewController") as? TableViewController {
            navigationController?.pushViewController(table, animated: true)
        }
    }
    
    @IBAction func openTask1(_ sender: UIButton) {
        if let taskPage = UIStoryboard(name: "Practical1", bundle: nil).instantiateViewController(withIdentifier: "TaskPageViewController") as? TaskPageViewController {
            navigationController?.pushViewController(taskPage, animated: true)
        }
    }
}
