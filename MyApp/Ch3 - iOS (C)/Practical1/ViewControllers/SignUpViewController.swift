//
//  Practical1ViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 01/03/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var tfEmail: CustomTextField!
    @IBOutlet weak var tvBio: CustomTextView!
    @IBOutlet weak var tfPassword: CustomTextField!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var rbMale: UIButton!
    @IBOutlet weak var rbFemale: UIButton!
    
    // MARK: - Variables
    var pageIndex = 0
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        imgUser.layer.cornerRadius = 40
        imgUser.layer.borderWidth = 1
        imgUser.layer.borderColor = UIColor.systemBlue.cgColor
        
        tfEmail.layer.cornerRadius = 3
        tfEmail.layer.borderColor = UIColor.systemBlue.cgColor
        tfEmail.layer.borderWidth = 1
        self.tfEmail.delegate = self
        tfEmail.returnKeyType = .next
        
        tfPassword.layer.cornerRadius = 3
        tfPassword.layer.borderColor = UIColor.systemBlue.cgColor
        tfPassword.layer.borderWidth = 1
        self.tfPassword.delegate = self
        tfPassword.returnKeyType = .done
        
        
        tvBio.layer.borderColor = UIColor.systemBlue.cgColor
        tvBio.layer.borderWidth = 1
        tvBio.layer.cornerRadius = 3
        tvBio.returnKeyType = .done
    }
    
    // MARK: - Actions
    @IBAction func ageValueChanged(_ sender: UISlider) {
        lblAge.text = "\(Int(sender.value))"
    }
    
    @IBAction func btnCreateProfile(_ sender: UIButton) {
        pageIndex = pageIndex + 1
        pageControl.currentPage = pageIndex
        
        UIView.animate(withDuration: 3.0) {
            self.progressView.setProgress(1.0, animated: true)
        }
    }
    
    @IBAction func rbtnAction(_ sender: UIButton) {
        if sender.tag == 1 {
            rbMale.isSelected = true
            rbFemale.isSelected = false
        }
        else {
            rbMale.isSelected = false
            rbFemale.isSelected = true
        }
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.tfEmail:
            self.tfPassword.becomeFirstResponder()
        case self.tfPassword:
            self.tfPassword.resignFirstResponder()
        case self.tvBio:
            self.tvBio.resignFirstResponder()
        default:
            self.tfEmail.resignFirstResponder()
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
}
