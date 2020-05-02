//
//  SignupVC.swift
//  stackz
//
//  Created by Theresa Chen on 5/2/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth


class SignUpVC: UIViewController {
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var RegisterButton: UIButton!
    
    @IBAction func backArrowPressed(_ sender: Any) {
        //dismiss(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginRegisterPressed(_ sender: Any) {
        handleRegister()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RegisterButton.layer.cornerRadius = 3
    }
        
        func handleRegister() {
            let name = nameTxtField.text!
            let username = usernameTxtField.text!
            let email = emailTxtField.text!
            let password = passwordTxtField.text!
            let auth = Auth.auth()
            //let RSVP : [String]
            
            auth.createUser(withEmail: email, password: password) { (user, error) in
                guard error == nil else {
                    self.displayAlert(title: "Error", message: error.debugDescription)
                    return
                }
                guard user != nil else {
                    self.displayAlert(title: "Error", message: "No user")
                    return
                }
                
                util.displayAlertDismiss(title: "Welcome to Stackz", message: "Login using your new user account", vc: self)
                let db = Database.database().reference()
                let usersNode = db.child("Users")
                let newUserId = usersNode.childByAutoId().key
                UserDefaults.standard.set(newUserId, forKey: "ID")
                let userNode = usersNode.child(newUserId!)
                userNode.updateChildValues(["name": name, "email": email,
                                            "username": username, ])
//                self.dismiss(animated: true, completion: nil)
            }
        }
        
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        RegisterButton.isUserInteractionEnabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }

}
