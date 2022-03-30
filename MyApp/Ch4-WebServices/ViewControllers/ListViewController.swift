//
//  ListViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 28/03/22.
//

import UIKit
import Alamofire
class ListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tblContents: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    //MARK: - Variables
    var users = [Users]()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tblContents.delegate = self
        tblContents.dataSource = self
        tblContents.register(UINib(nibName: Constants.userCellName, bundle: nil), forCellReuseIdentifier: Constants.userCell)
        loader.startAnimating()
        loadJsonData()
    }
    
    //MARK: - Actions
    @IBAction func createUserAction(_ sender: UIButton) {
        if let createUserVc = UIStoryboard(name: Constants.login, bundle: nil).instantiateViewController(withIdentifier: Constants.createUserViewController) as? CreateUserViewController {
            self.navigationController?.pushViewController(createUserVc, animated: true)
        }
    }
    
    //MARK: - Functions
    func loadJsonData() {
        AF.request(Constants.delayUrl).response {
            response in
            
            guard let data = response.data else {
                return
            }
            do {
                let json = try JSONDecoder().decode(Response.self, from: data)
                self.users = json.data
                self.loader.stopAnimating()
                self.tblContents.alpha = CGFloat(Constants.one)
                self.tblContents.reloadData()
            }
            catch let error {
                print(error)
            }
        }
    }
}

//MARK: - Extensions
extension ListViewController: UITableViewDelegate {
    //to be implemented
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userCell) as? UserCell else {
            return UITableViewCell()
        }
        let data = users[indexPath.row]
        cell.configCell(data: data)
        print(data.avatar)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let singleUserVc = UIStoryboard(name: Constants.login, bundle: nil).instantiateViewController(withIdentifier: Constants.singleUserViewController) as? SingleUserViewController {
            singleUserVc.id = users[indexPath.row].id
            self.navigationController?.pushViewController(singleUserVc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
