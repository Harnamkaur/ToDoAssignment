//
//  File name -AddDiscrptionViewController.swift
//  IOS_Assignment2_ToDoApp
//Author's name - Harnam kaur
//app name- ToDo App
//Studsent id -301093907
//file description - Thi is the second view controller where every operation related to task is performed like add task , delete and  update .. And every task is added to firebase.

import UIKit
import Firebase

class AddDiscrptionViewController: UIViewController {

    @IBOutlet weak var Titlename: UITextField!
    @IBOutlet weak var Details: UITextField!
    var d:String = ""
    var dict = [String:AnyObject]()
 
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

     print("dict",dict)
    }
    
    @IBAction func UpdateTask(_ sender: UIButton) {
        db = Firestore.firestore()
              

        let parameters = ["name":Titlename.text!,"notes":Details.text!,"docId":dict["docId"]!,"completed":false,"date":dict["date"]!] as [String : Any]
        

               db?.collection("data").document((dict["docId"] as? String)!).updateData(parameters as [String : Any]){
                   err in
                   if let error = err{
                       print(error.localizedDescription)
                       
                   }else{
                       print("document added successfully")
                       
                       let alert = UIAlertController(title: "Message", message: "Successfully Updated", preferredStyle: .alert)
                       let okay = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        //   self.navigationController?.popViewController(animated: true)
                       })
                       alert.addAction(okay)
                       self.present(alert, animated: true, completion: nil)
                       
                       
                   }

               }
        
        
    }
    
   
       
        
    
    @IBAction func DeleteTask(_ sender: UIButton) {
        db = Firestore.firestore()
               db?.collection("data").document((dict["docId"] as? String)!).delete(){
                   err in
                   if let error = err{
                       print(error.localizedDescription)
                       
                   }else{
                       print("document deleted successfully")
                       
                       let alert = UIAlertController(title: "Message", message: "Successfully Deleted", preferredStyle: .alert)
                       let okay = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                          // self.navigationController?.popViewController(animated: true)
                       })
                       alert.addAction(okay)
                       self.present(alert, animated: true, completion: nil)
                   }
               }
    }
    
    @IBAction func CancelTask(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
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
                     //  self.navigationController?.popViewController(animated: true)
                   })
                   alert.addAction(okay)
//
                                       self.present(alert, animated: true, completion: nil)
               }
    
           }

            
            
            
            
            
        }
        
       
    }




       

   

