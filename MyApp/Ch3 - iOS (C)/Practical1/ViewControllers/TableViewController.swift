//
//  TableViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 03/03/22.
//

import UIKit

class TableViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tblContent: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var tblHeader: UILabel!
    
    //MARK: - Variables
    var cricketers = CricketerModel.getCricketers()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tblContent.delegate = self
        tblContent.dataSource = self
        tblContent.register(UINib(nibName:Constants.tableViewCellName , bundle: nil), forCellReuseIdentifier: Constants.tableViewCell)
        tblContent.tableHeaderView = headerView
    }
}

//MARK: - Table DataSource
extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Int(Constants.one)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cricketers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cricketerCell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCell) as? TableViewCell else {
            return UITableViewCell()
        }
        let currentData = cricketers[indexPath.row]
        cricketerCell.configCell(data: currentData)
        return cricketerCell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableRowHeight
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
}
