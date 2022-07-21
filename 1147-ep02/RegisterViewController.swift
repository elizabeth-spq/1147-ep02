//
//  RegisterViewController.swift
//  1147-ep02
//
//  Created by Elizabeth Silvia Pumacota Quispe on 20/07/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("register")
    }
    
    @IBAction func makeRegister(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        // Create a new user
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("createUser success!!")
                Auth.auth().signIn(withEmail: email, password: password)
                
            } else {
                print("Error in createUser")
                print(error?.localizedDescription ?? "")
            }
        }
    }
}
