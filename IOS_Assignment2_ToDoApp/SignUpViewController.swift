//
//  SignUpViewController.swift
//  IOS_Assignment2_ToDoApp
//
//  Created by Harnam kaur on 04/12/19.
//  Copyright © 2019 Harnam kaur. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var Emailsignup: UITextField!
    @IBOutlet weak var passwordSignUp: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func ButtonSignUp(_ sender: UIButton) {
        
       
        var email  = Emailsignup.text!
        var password  = passwordSignUp.text!
        
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if ((error) != nil){
                var alertController = UIAlertController(title: "Error", message:
                    error?.localizedDescription as! String, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
            
            else{
                           let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                           self.present(mainVC, animated: true, completion: nil)
                       }
        }
    }
    
}
