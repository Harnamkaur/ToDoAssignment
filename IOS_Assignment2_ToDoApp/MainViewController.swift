//
// File name-  MainViewController.swift
//  IOS_Assignment2_ToDoApp
//Author's name - Harnam kaur
//app name- ToDo App
//Student id -301093907
//file description -This is the fireview controller where u can see all the added tasks or add task button is here .. if u wantto edit a task the button of  this is next after the every task 

//

import UIKit
import Firebase

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var db: Firestore?
    var dictionary = [[String:AnyObject]]()
    var arr = ["Task1","Task2"]
   
    var indexDict = [String:AnyObject]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        
        retrieveData()
        
    }
    

    

    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
        return dictionary.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let index = dictionary[indexPath.row]
        print("index",index)
        
        if let x = cell.viewWithTag(1) as? UILabel{
            x.text = index["name"] as? String
        }
        
        
        if let y = cell.viewWithTag(2) as? UILabel{
            y.text = index["notes"] as? String
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexDict = dictionary[indexPath.row]
        self.performSegue(withIdentifier: "data", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "data"{
            let vc = segue.destination as? AddDiscrptionViewController
            vc!.dict = indexDict
        }
    }
    
    
    
    func retrieveData(){
        self.dictionary.removeAll()
        db = Firestore.firestore()
        db?.collection("data").getDocuments(completion: { (snap, err) in

            for i in snap!.documents{
                self.dictionary.append(i.data() as [String : AnyObject])

            }
            print("dict is",self.dictionary)

            self.tableView.reloadData()
        })
        


        
    }
    
    
    @IBAction func addTask(_ sender: UIButton) {
         self.performSegue(withIdentifier: "addtask", sender: nil)
    }
    
//    @IBAction func add(_ sender: UIBarButtonItem) {
//        self.performSegue(withIdentifier: "addtask", sender: nil)
//
//    }
    
    
}
