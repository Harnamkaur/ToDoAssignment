//
//  ViewController.swift
//  IOS_Assignment2_ToDoApp
//
//  Created by Harnam kaur on 03/12/19.
//  Copyright © 2019 Harnam kaur. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var EmailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    
    @IBAction func LoginButton(_ sender: UIButton) {
        
        
       
            var e = EmailLogin.text!
            var p = passwordLogin.text!
            
            Auth.auth().signIn(withEmail: e, password: p) { [weak self] authResult, error in
                if(error != nil){
                    var alertController = UIAlertController(title: "Error", message:
                        error?.localizedDescription as! String, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    
                    self?.present(alertController, animated: true, completion: nil)
                }
                else{
                    var uid = Auth.auth().currentUser!.uid
                    print(uid)
                    let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    self!.present(loginVC, animated: true, completion: nil)
                    
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        
    }


}

