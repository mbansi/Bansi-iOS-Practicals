//
//  MainViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 07/03/22.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var gridCollectionView: UICollectionView!
    @IBOutlet weak var listView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var stepper: UIStepper!
    
    //MARK: - Variables
    var allData = CricketerModel.getCricketers()
    var initialdata: [CricketerModel] = []
    var refreshData: UIRefreshControl!
    var searchResult: [CricketerModel] = []
    var isSearchActive = false
    var cName: String = ""
    var cImage: String = ""
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiser()
    }
    
    //MARK: - Functions
    
    func initialiser() {
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
        self.refreshData = UIRefreshControl()
        self.refreshData.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
        self.gridCollectionView.addSubview(refreshData)
        self.gridCollectionView.alwaysBounceVertical = true
        self.gridCollectionView.bounces = true
        
        listView.register(UINib(nibName: Constants.tableViewCellName, bundle: nil), forCellReuseIdentifier: Constants.tableViewCell)
        self.listView.rowHeight = 100
    }
    
    @objc func loadData() {
        print("Loading...")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            self.refreshData.endRefreshing()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.detailViewController {
            guard let vc = segue.destination as? DetailViewController else{
                return
            }
            vc.name = cName
            vc.image = cImage
        }
    }
    
    
    //MARK: - Actions
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == .zero {
            self.gridCollectionView.alpha = Constants.one
            self.listView.alpha = .zero
        }
        else {
            self.gridCollectionView.alpha = .zero
            self.listView.alpha = Constants.one
        }
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        if Int(sender.value) == .zero {
            initialdata = []
            gridCollectionView.reloadData()
            listView.reloadData()
        }
        else {
            var tempData: [CricketerModel] = []
            for index in 1...Int(sender.value) {
                tempData.append(allData[index - 1])
            }
            initialdata = tempData
            gridCollectionView.reloadData()
            listView.reloadData()
        }
    }
}

//MARK: - Extensions
//MARK: - Collection DataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearchActive == true ? searchResult.count : initialdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cricketerCell = gridCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.cricketerViewCell, for: indexPath) as? CricketerViewCell else {
            return UICollectionViewCell()
        }
        let currentData = isSearchActive == true ? searchResult[indexPath.row] : allData[indexPath.row]
        cricketerCell.configCell(data: currentData)
        return cricketerCell
    }
}

//MARK: - Collection Delegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cName = initialdata[indexPath.row].cricketerName
        cImage = initialdata[indexPath.row].cricketerImage
        performSegue(withIdentifier: Constants.detailViewController, sender: self)
    }
}

//MARK: - Collection DelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/3, height: 120)
    }
}

//MARK: - Table DataSource
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Int(Constants.one)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive == true ? searchResult.count : initialdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cricketerCell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCell) as? TableViewCell else {
            return UITableViewCell()
        }
        let currentData =  isSearchActive == true ? searchResult[indexPath.row] : allData[indexPath.row]
        cricketerCell.configCell(data: currentData)
        return cricketerCell
    }
}

//MARK: - Table Delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cName = allData[indexPath.row].cricketerName
        cImage = allData[indexPath.row].cricketerImage
        performSegue(withIdentifier: Constants.detailViewController, sender: self)
    }
}

//MARK: - Search Delegate
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearchActive = true
        searchResult = searchText.isEmpty ? allData : allData.filter { (cricketer: CricketerModel) in
            cricketer.cricketerName.lowercased().contains(searchText.lowercased())
        }
        isSearchActive = searchText.isEmpty ? false : true
        gridCollectionView.reloadData()
        listView.reloadData()
    }
}
