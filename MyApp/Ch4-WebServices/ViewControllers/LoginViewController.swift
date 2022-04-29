//
//  LoginViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 25/03/22.
//

import UIKit



class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var lblResponse: UILabel!
    
    //MARK: - Variables
    var responseToken: String?
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    @IBAction func loginUserAction(_ sender: Any) {
        
        let userModel = LoginUser(email: tfUsername.text ?? "eve.holt@reqres.in", password: tfPassword.text ?? "cityslicka")
        
        if tfUsername.text?.isEmpty == true {
            showAlert("No email", "Please enter your email")
        }
        guard let email = tfUsername.text else {
            return
        }
        if isValidEmail(email) == false {
            showAlert("Invalid Email", "Please enter a proper email")
        }
        if tfPassword.text?.isEmpty == true {
            showAlert("No password", "Please enter your password")
        }
        loginUser(userModel)
    }
    
    //MARK: - Functions
    func showAlert(_ title: String,_ message: String){
        let alert = UIAlertController(title: title, message:   message , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func loginUser(_ user: LoginUser) {
        if let url = URL(string: "https://reqres.in/api/login") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                urlRequest.httpBody = try JSONEncoder().encode(user)
            } catch let error {
                print("Error in Json encoding - \(error.localizedDescription)")
            }
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest){ (data, urlResponse,error) in
                guard let responseData = data else {
                    return
                }
                
                if let httpResponse = urlResponse as? HTTPURLResponse {
                    print("error \(httpResponse.statusCode)")
                    
                    if httpResponse.statusCode == 200 {
                        DispatchQueue.main.async {
                            if let listVc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as? ListViewController {
                                
                                self.navigationController?.pushViewController(listVc, animated: true)
                            }
                        }
                    }
                }
                
                do {
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode(LoginUserResponse.self, from: responseData)
                    print("Token: \(String(describing: userResponse.token))")
                    
                    DispatchQueue.main.async {
                        self.lblResponse.text = userResponse.token
                    }
                    
                } catch let error {
                    print("Error - \(error)")
                }
                
            }
            dataTask.resume()
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
}
