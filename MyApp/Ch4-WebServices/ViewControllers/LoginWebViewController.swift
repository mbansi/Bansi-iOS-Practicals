//
//  LoginViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 25/03/22.
//

import UIKit

class LoginWebViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var lblResponse: UILabel!
    
    //MARK: - Variables
    var responseToken: String?
    let noEmail = NSLocalizedString("No email", comment: "")
    let alertNoEmail = NSLocalizedString("Please enter your email", comment: "")
    let invalidEmail = NSLocalizedString("Invalid Email", comment: "")
    let alertInvalidEmail = NSLocalizedString("Please enter a proper email", comment: "")
    let noPassword = NSLocalizedString("No password", comment: "")
    let alertNoPassword = NSLocalizedString("Please enter your password", comment: "")
    let alertOK = NSLocalizedString("OK", comment: "")
    let email = "eve.holt@reqres.in"
    let password = "cityslicka"
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func loginUserAction(_ sender: Any) {
        let userModel = LoginUser(email: tfUsername.text ?? email, password: tfPassword.text ?? password)
        if tfUsername.text?.isEmpty == true {
            showAlert(noEmail, alertNoEmail)
        }
        guard let email = tfUsername.text else {
            return
        }
        if isValidEmail(email) == false {
            showAlert(invalidEmail, alertInvalidEmail)
        }
        if tfPassword.text?.isEmpty == true {
            showAlert(noPassword, alertNoPassword)
        }
        loginUser(userModel)
    }
    
    //MARK: - Functions
    func showAlert(_ title: String,_ message: String){
        let alert = UIAlertController(title: title, message:   message , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: alertOK, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func loginUser(_ user: LoginUser) {
        if let url = URL(string: Constants.url) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = Constants.post
            urlRequest.addValue(Constants.applicationJson, forHTTPHeaderField: Constants.contentType)
            do {
                urlRequest.httpBody = try JSONEncoder().encode(user)
            } catch let error {
                print(error.localizedDescription)
            }
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest){ (data, urlResponse,error) in
                guard let responseData = data else {
                    return
                }
                
                if let httpResponse = urlResponse as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                    
                    if httpResponse.statusCode == Constants.statusCode {
                        DispatchQueue.main.async {
                            if let listVc = UIStoryboard(name: Constants.login, bundle: nil).instantiateViewController(withIdentifier: Constants.listViewController) as? ListViewController {
                                self.navigationController?.pushViewController(listVc, animated: true)
                            }
                        }
                    }
                }
                
                do {
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode(LoginUserResponse.self, from: responseData)
                    print(String(describing: userResponse.token))
                    
                    DispatchQueue.main.async {
                        self.lblResponse.text = userResponse.token
                    }
                    
                } catch let error {
                    print(error)
                }
            }
            dataTask.resume()
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = Constants.emailRegex
        let emailPred = NSPredicate(format: Constants.matchEmail, emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
