//
//  AuthenticationVC.swift
//  stackz
//
//  Created by Theresa Chen on 5/2/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth


class AuthenticationVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func tabLogInButton(_ sender: Any) {
        handleLogin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 3
        currentFeed = Firebase.accessPostsInDB()
    }
    
    func handleLogin() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        let auth = Auth.auth()
        auth.signIn(withEmail: email, password: password) {(user, error) in
            guard error == nil || user != nil else {
                self.displayAlert(title: "Error", message: "Invalid Credentials")
                return
            }
            
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
            self.performSegue(withIdentifier: "toFeed", sender: self)
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
 
}



