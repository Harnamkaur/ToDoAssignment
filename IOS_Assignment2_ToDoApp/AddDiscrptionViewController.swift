//
//  AddDiscrptionViewController.swift
//  IOS_Assignment2_ToDoApp
//
//  Created by Harnam kaur on 04/12/19.
//  Copyright © 2019 Harnam kaur. All rights reserved.
//

import UIKit
import Firebase

class AddDiscrptionViewController: UIViewController {

    @IBOutlet weak var Titlename: UITextField!
    @IBOutlet weak var Details: UITextField!
    
    var db:Firestore?

    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()


    }
    

   @IBAction func Done(_ sender: UIButton) {
    
    
       db = Firestore.firestore()



       let docId = db?.collection("users").document().documentID

       let parameters = ["name":Titlename.text!,"notes":Details.text!,"docId":docId!,"completed":false] as [String : Any]

       db?.collection("users").document(docId!).setData(parameters as [String : Any]){
           err in
           if let error = err{
               print(error.localizedDescription)
             //  self.indicator.stopAnimating()
           }else{
               print("document added successfully")
              // self.indicator.stopAnimating()
               let alert = UIAlertController(title: "Message", message: "Successfully added", preferredStyle: .alert)
               let okay = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                   self.navigationController?.popViewController(animated: true)
               })
               alert.addAction(okay)
               self.present(alert, animated: true, completion: nil)
           }

       }

       }

   }

