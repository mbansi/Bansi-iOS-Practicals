//
//  HomeViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 04/03/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        displayActivityIndicator()
    }
    
    //MARK: - Functions
    func displayActivityIndicator() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
            guard let url = URL(string: Constants.googleUrl) else {
                return
            }
            let urlRequest = URLRequest(url: url)
            self.webView.load(urlRequest)
            self.activityIndicator.stopAnimating()
        }
    }
}
