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
        if let tabBar = UIStoryboard(name: Constants.practical23Storyboard, bundle: nil).instantiateViewController(withIdentifier: Constants.tabBarViewController) as? TabBarViewController {
            navigationController?.pushViewController(tabBar, animated: true)
        }
    }
    
    @IBAction func openTableView(_ sender: UIButton) {
        if let table = UIStoryboard(name: Constants.practical1StoryBoard, bundle: nil).instantiateViewController(withIdentifier: Constants.tableViewController) as? TableViewController {
            navigationController?.pushViewController(table, animated: true)
        }
    }
    
    @IBAction func openTask1(_ sender: UIButton) {
        if let taskPage = UIStoryboard(name: Constants.practical1StoryBoard, bundle: nil).instantiateViewController(withIdentifier: Constants.taskPageViewController) as? TaskPageViewController {
            navigationController?.pushViewController(taskPage, animated: true)
        }
    }
}
