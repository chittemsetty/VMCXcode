//
//  FirstViewController.swift
//  tabbedview
//
//  Created by Venu Chittemsetty on 3/27/16.
//  Copyright © 2016 Vedya Wonders. All rights reserved.
//

import UIKit
import AddressBook

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var contactsTableView: UITableView!
    
    var contactNames : [String] = ["VMC","Rith","Sah","Jt"]
    
    var menuArray : NSArray = [] ;
    var plistPath :NSString = NSBundle.mainBundle().pathForResource("Menu", ofType: "plist")!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.contactsTableView.delegate = self
        self.contactsTableView.dataSource = self
        self.menuArray = NSArray.init(contentsOfFile: plistPath as String)!
        self.contactsTableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return menuArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.menuArray[indexPath.row] as? String
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

