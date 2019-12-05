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
    var d:String = ""
    
 
    @IBAction func DatePicker(_ sender: UIDatePicker) {
    
        let datep = sender.date
                  let formatter = ISO8601DateFormatter()
                  formatter.timeZone = .current
                  d = formatter.string(from: datep)
        print(d)
        
    }
    var db:Firestore?

    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()


    }
    

   @IBAction func Done(_ sender: UIButton) {
    
    if (d == ""){
        var alertController = UIAlertController(title: "Error", message:
            "Select date and time" as! String, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
        return
    }
    if (Titlename.text == ""){
               var alertController = UIAlertController(title: "Error", message:
                   "Enter heading" as! String, preferredStyle: .alert)
               alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
               self.present(alertController, animated: true, completion: nil)
               return
           }
           if(Details.text == ""){
               var alertController = UIAlertController(title: "Error", message:
                   "Enter des" as! String, preferredStyle: .alert)
               alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
               self.present(alertController, animated: true, completion: nil)
               return
           }
           
    
    
//       db = Firestore.firestore()
//            var db = Firestore.firestore()
//            var s = Auth.auth().currentUser!.uid
//            db.collection(s).document(Titlename.text!).setData([
//                "heading": Titlename.text,
//                "description": Details.text,
//                "date": d
//            ]) { err in
//                if let err = err {
//                    print("Error writing document: \(err)")
//                } else {
//                    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainViewController") as! MainViewController
//                    self.present(mainVC, animated: true, completion: nil)
//                }
//            }
    
    
           let docId = db?.collection("data").document().documentID
    
    let parameters = ["name":Titlename.text!,"notes":Details.text!,"date": d,"docId":docId!,"completed":false] as [String : Any]
    
           db?.collection("data").document(docId!).setData(parameters as [String : Any]){
               err in
               if let error = err{
                   print(error.localizedDescription)
                 // self.indicator.stopAnimating()
               }else{
                   print("document added successfully")
                  // self.indicator.stopAnimating()
                   let alert = UIAlertController(title: "Message", message: "Successfully added", preferredStyle: .alert)
                   let okay = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                       self.navigationController?.popViewController(animated: true)
                   })
                   alert.addAction(okay)
//
                                       self.present(alert, animated: true, completion: nil)
               }
    
           }

            
            
            
            
            
        }
        
       
    }


//       let docId = db?.collection("users").document().documentID
//
//       let parameters = ["name":Titlename.text!,"notes":Details.text!,"docId":docId!,"completed":false] as [String : Any]
//
//       db?.collection("users").document(docId!).setData(parameters as [String : Any]){
//           err in
//           if let error = err{
//               print(error.localizedDescription)
//             //  self.indicator.stopAnimating()
//           }else{
//               print("document added successfully")
//              // self.indicator.stopAnimating()
//               let alert = UIAlertController(title: "Message", message: "Successfully added", preferredStyle: .alert)
//               let okay = UIAlertAction(title: "OK", style: .default, handler: { (action) in
//                   self.navigationController?.popViewController(animated: true)
//               })
//               alert.addAction(okay)
//               self.present(alert, animated: true, completion: nil)
//           }
//
//       }

       

   

