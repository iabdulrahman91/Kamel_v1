//
//  LoginViewController.swift
//  Kamel_v1
//
//  Created by abdulrahman alanazi on 12/13/18.
//  Copyright © 2018 Halaworld. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController, LoginModelDelegate {
    
    
    
    let loginModel:LoginModel = LoginModel()
    var foundAccount:Account?
    
    // MARK: - UI elements
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginModel.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Delegate Implementation
    func accountDownloaded(account: Account?) {
        self.foundAccount = account
    }
    
    
    // MARK: - buttons
    @IBAction func loginTapped(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if(email.isEmpty || password.isEmpty){
            displayMyAlertMessage(userMessage: "All fields are required")
            return
        }
        
        // call model to get account
        loginModel.getAccount(email: email)
        while foundAccount==nil {
            // just wait for response
        }
        if(foundAccount?.email == email && foundAccount?.password == password){
            
            // Login is successful
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
    
            self.dismiss(animated: true, completion: nil)
        } else {
            displayMyAlertMessage(userMessage: "Wrong Entry")
            foundAccount = nil
        }
            
    }
    
    @IBAction func registrationTapped(_ sender: Any) {
        performSegue(withIdentifier: "registrationSegue", sender: self)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helper Functions
    func displayMyAlertMessage(userMessage:String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert,animated: true,completion: nil)
        
    }
}
