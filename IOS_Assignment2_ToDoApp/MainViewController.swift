//
//  MainViewController.swift
//  IOS_Assignment2_ToDoApp
//
//  Created by Harnam kaur on 04/12/19.
//  Copyright © 2019 Harnam kaur. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

   
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        
        
        
    }
    

    
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "addtask", sender: nil)
        
    }
    
    
}
