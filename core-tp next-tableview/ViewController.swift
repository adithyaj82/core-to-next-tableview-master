//
//  ViewController.swift
//  core-tp next-tableview
//
//  Created by apple on 5/10/18.
//  Copyright © 2018 aditya. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet var firstName: UITextField!
    
    @IBOutlet var secondName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func saveUser(_ sender: Any) {
        
        if firstName.text != "" && secondName.text != "" {
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
            
            newUser.setValue(self.firstName.text, forKey: "firstName")
            newUser.setValue(self.secondName.text, forKey: "secondName")
            do
            {
                try context.save()
                print(newUser)
            }
            catch{
                print(error)
            }
        }else{
            print("please fill details")
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

