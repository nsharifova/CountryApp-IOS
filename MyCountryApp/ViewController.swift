//
//  ViewController.swift
//  MyCountryApp
//
//  Created by Nurluay Sharifova on 15.09.24.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        initializeHideKeyboard()
        super.viewDidLoad()
        passwordField.delegate = self
        
    }
    
    
    func initializeHideKeyboard() {
        view.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard)))
        
    }
    @objc func dismissMyKeyboard(){
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
    }
    @IBAction func switchButtonAction(_ sender: UISwitch) {
        passwordField.isSecureTextEntry = !sender.isOn
        
    }
    @IBAction func saveButton(_ sender: Any) {
        let data = UserData(email: emailField.text ?? "", password: passwordField.text ?? "")
        
        if data.email.isEmpty || data.password.isEmpty {
            showAlert(message: "Please fill the fields")
        } else if !data.isPasswordValid() {
            showAlert(message: "Character must be at least 5 and at most 15")
        } else{
            
            let controller = storyboard?.instantiateViewController(withIdentifier: "countryCV") as! CountyViewController
            navigationController?.show(controller, sender: nil)
            
        }
    }
    
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
}

