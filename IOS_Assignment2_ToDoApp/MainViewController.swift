//
//  MainViewController.swift
//  IOS_Assignment2_ToDoApp
//
//  Created by Harnam kaur on 04/12/19.
//  Copyright © 2019 Harnam kaur. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var db: Firestore?
    var dictionary = [[String:AnyObject]]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        
        retrieveData()
        
    }
    

    
    func retrieveData(){
        
       db = Firestore.firestore()
        db?.collection("data").getDocuments(completion: { (snap, err) in
            
            for i in snap!.documents{
                self.dictionary.append(i.data() as [String : AnyObject])
                
            }
            print("dict is",self.dictionary)
            
            self.tableView.reloadData()
        })
        
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section:  Int) -> Int {
        return dictionary.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "addtask", sender: nil)
        
    }
    
    
}
