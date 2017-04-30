//
//  ViewController.swift
//  addressbookTest
//
//  Created by Venu Chittemsetty on 3/27/16.
//  Copyright © 2016 Vedya Wonders. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI
import AddressBook
import AddressBookUI
import MessageUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var menuArray : NSArray = [] ;
  //  var plistPath :NSString = NSBundle.mainBundle().pathForResource("Menu", ofType: "plist")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let authorizationStatus = ABAddressBookGetAuthorizationStatus()
        
        let addressBookRef: ABAddressBook = ABAddressBookCreateWithOptions(nil, nil).takeRetainedValue()
        
        switch authorizationStatus {
      //  case .Denied, .Restricted:
      //      print("Denied")
        case .Authorized:
            print("Authorized")
        default:
            var err: Unmanaged<CFError>? = nil
            ABAddressBookRequestAccessWithCompletion(addressBookRef) {
                (granted: Bool, error: CFError!) in dispatch_async(dispatch_get_main_queue()){
                    if !granted {
                        print("Just Denied")
                    } else {
                        print("Just Authorized")
                    }
                }
            }
            print("Not Determind")
        }
        let url = NSURL(string: UIApplicationOpenSettingsURLString)
        UIApplication.sharedApplication().openURL(url!)
     //   var code = NSCoder()
  //      let keyDes = CNKeyDescriptor(coder: code)
  //      self.menuArray = CNContactFetchRequest(keysToFetch: keyDes)
        
        self.menuArray = ABAddressBookCopyArrayOfAllPeople(addressBookRef).takeRetainedValue() as Array
        self.tableView.reloadData()
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = ABRecordCopyCompositeName(menuArray[indexPath.row]).takeRetainedValue() as String
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuArray.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UIAlertAction(title: "Show Contact", style: .Default, handler: { action in
            let personViewController = ABPersonViewController()
            personViewController.displayedPerson = self.menuArray[indexPath.row]
            self.navigationController?.pushViewController(personViewController, animated: true)
        })
        
    }
    @IBAction func sendSMS(sender: UIButton) {
        var messageVC = MFMessageComposeViewController()
        
        messageVC.body = "Enter a message";
        messageVC.recipients = ["Enter tel-nr"]
        messageVC.messageComposeDelegate = self;
        
        self.presentViewController(messageVC, animated: false, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        switch (result.rawValue) {
        case MessageComposeResultCancelled.rawValue:
            print("Message was cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultFailed.rawValue:
            print("Message failed")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultSent.rawValue:
            print("Message was sent")
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            break;
        }
    }

}

