//
//  CreateUserViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 30/03/22.
//

import UIKit
import Alamofire

class CreateUserViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tfJob: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    //MARK: - Variables
    let invalidName = NSLocalizedString("Invalid Name", comment: "")
    let alertInvalidName =  NSLocalizedString("Please enter your name", comment: "")
    let invalidJob = NSLocalizedString("Invalid Job", comment: "")
    let alertInvalidJob = NSLocalizedString("Please enter your job", comment: "")
    let alertOK = NSLocalizedString("OK", comment: "")
    let alertUserCreated = NSLocalizedString("User Created", comment: "")
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        self.dismissKeyboard(view)
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func createUser(_ sender: UIButton) {
        if tfName.text?.isEmpty == true {
            showAlert(invalidName,alertInvalidName)
        }
        if tfJob.text?.isEmpty == true {
            showAlert(invalidJob, alertInvalidJob)
        }
        createUserData()
        showAlert(invalidName,alertInvalidName)
    }
    
    //MARK: - Functions
    func showAlert(_ title: String,_ message: String){
        let alert = UIAlertController(title: title, message:   message , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: alertOK, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.tfName:
            self.tfJob.becomeFirstResponder()
        case self.tfJob:
            self.tfJob.resignFirstResponder()
        default:
            break
        }
    }
    
    func createUserData() {
        let parameters = [ Constants.parameterName: tfName.text, Constants.parameterJob: tfJob.text]
        let urlString = Constants.usersUrl
        
        AF.request(urlString, method: .post, parameters: parameters as Parameters ,encoding: JSONEncoding.default, headers: nil).response {
            response in
            switch response.result {
            case .success:
                print(response)
                guard let responseData = response.data else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode(CreateUser.self, from: responseData)
                    
                    let message = "Name: \(userResponse.name) \n Job: \(userResponse.job) \n Id: \(userResponse.id) \n Time: \(userResponse.createdAt)"
                    self.showAlert(self.alertUserCreated, message)
                    
                } catch let error {
                    print(error)
                }
                break
            case .failure(let error):
                print("Error - \(error)")
            }
        }
    }
}

extension CreateUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
}
