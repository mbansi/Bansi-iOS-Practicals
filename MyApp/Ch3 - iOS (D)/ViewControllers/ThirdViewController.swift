//
//  FifthViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 11/03/22.
//

import UIKit

class ThirdViewController: UIViewController {

    //MARK: - Variables
    @IBOutlet weak var tblContent: UITableView!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let customView = UIView(frame: CGRect(x: .zero, y: .zero, width: Constants.width200, height: Constants.height50))
        customView.backgroundColor = UIColor.red
        tblContent.dataSource = self
        tblContent.delegate = self
        tblContent.tableFooterView = customView
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - Action
    @IBAction func popToFirst(_ sender: UIButton) {
        if let viewController = self.navigationController?.viewControllers.first(where: {$0 is FirstViewController}) {
            self.navigationController?.popToViewController(viewController, animated: true)
        }
    }
}

//MARK: - Extension
extension ThirdViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) {
            return cell
        }
        return UITableViewCell()
    }
}

extension ThirdViewController: UITableViewDelegate {
    
}
