//
//  ViewController.swift
//  CoreDatatest
//
//  Created by Venu Chittemsetty on 4/23/17.
//  Copyright © 2017 Vedya Wonders. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tasks : [TaskDB] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var tasktableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tasktableView.dataSource = self
        tasktableView.delegate = self
        
        //context.delete(<#T##object: NSManagedObject##NSManagedObject#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tasktableView.reloadData()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.taskEntryDB
        return cell
    }
 //   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
 //   }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func getData() {
  //     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        tasks = try context.fetch(TaskDB.fetchRequest())
        } catch  {
            print("Core Data Fetch Failed")}
    }

}

