//
//  ViewController1.swift
//  storecore
//
//  Created by apple on 4/9/18.
//  Copyright © 2018 BRN. All rights reserved.
//

import UIKit
import CoreData
class ViewController1:UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var userArray = [String]()
    var userArray2 = [String]()

    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetch()

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let name = userArray[indexPath.row]
//        print(name)
        cell.textLabel?.text = userArray[indexPath.row]
        cell.detailTextLabel?.text = userArray2[indexPath.row]
        return cell
        
    }
    

    func fetch(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        
        do
        {
            let arrStud = try context.fetch(fetch)
            for i in arrStud as! [NSManagedObject]{
                
                let str:String = i.value(forKey: "firstName") as! String
                let str2:String = i.value(forKey: "secondName") as! String

            print(str)
                print(str2)
                self.userArray.append(str)
                self.userArray2.append(str2)

            }}
        catch{
            print(error)
        }
        OperationQueue.main.addOperation {
            self.tableview.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}
