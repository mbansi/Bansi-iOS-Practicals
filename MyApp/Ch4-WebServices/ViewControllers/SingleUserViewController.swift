//
//  SingleUserViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 29/03/22.
//

import UIKit

class SingleUserViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var viewUser: UIView!
    
    //MARK: - Variables
    var id: Int?
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.startAnimating()
        viewUser.alpha = .zero
        loadSingleUserData()
    }
    
    //MARK: - Function
    func loadSingleUserData() {
        guard let id = id else {
            return
        }
        if let url = URL(string: Constants.singleUserUrl + String(id)){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = Constants.get
            urlRequest.addValue(Constants.applicationJson, forHTTPHeaderField: Constants.contentType)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest){ [weak self]  (data, urlResponse,error) in
                guard let uSelf = self, let responseData = data else {
                    return
                }
                let decoder = JSONDecoder()
                let userdata = try? decoder.decode(SingleUser.self, from: responseData)
                DispatchQueue.main.async {
                    guard let userId = uSelf.id else {
                        return
                    }
                    uSelf.lblId.text = String(userId)
                    
                    guard let user = userdata?.data else {
                        return
                    }
                    uSelf.lblName.text = user.firstName + " " + user.lastName
                    uSelf.lblEmail.text = user.email
                    guard let url = URL(string: user.avatar) else {
                        return
                    }
                    guard let image = try? UIImage(data: Data(contentsOf: url)) else {
                        return
                    }
                    uSelf.imgUser.image = image
                    uSelf.loader.stopAnimating()
                    uSelf.viewUser.alpha = CGFloat(Constants.one)
                }
            }
            dataTask.resume()
        }
    }
}
