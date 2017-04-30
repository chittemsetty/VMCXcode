//
//  AddTaskViewController.swift
//  CoreDatatest
//
//  Created by Venu Chittemsetty on 4/23/17.
//  Copyright © 2017 Vedya Wonders. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var textEntitySC: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTaskSC(_ sender: Any) {
     let contextAP =   (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
         let task = TaskDB(context: contextAP)
        task.taskEntryDB = textEntitySC.text
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
