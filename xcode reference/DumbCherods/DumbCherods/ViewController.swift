//
//  ViewController.swift
//  DumbCherods
//
//  Created by Venu Chittemsetty on 12/31/15.
//  Copyright © 2015 Vedya Wonders. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var word: UILabel!
    
    @IBOutlet weak var next: UIButton!
    let wordfile = NSBundle.mainBundle().pathForResource("wordslist", ofType: "strings")
    var wordslist = NSString()
    var loadedDictionary = NSDictionary()
    
    let dictionaryFilePath = "your.plist"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.category.text = "Nothing yet"
        self.word.text = "Click on Start to get first word"
        self.next.titleLabel?.text = "Start"
        self.wordslist = try! NSString(contentsOfFile: "wordslist.strings", encoding: NSUTF8StringEncoding)
        
        if self.loadedDictionary == readDictionaryFromFile(dictionaryFilePath)!{
            print(loadedDictionary.description)
  /Users/venuchittemsetty/Dropbox/xcode/xcode reference/DumbCherods/DumbCherods.xcodeproj      }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextWord(sender: UIButton) {
        self.word.text = self.loadedDictionary
    }
    
    func readDictionaryFromFile(filePath:String) -> Dictionary<String,String>? {
        
        
     
        let data : NSData! = try? NSData.init(contentsOfFile: filePath, options: NSDataReadingOptions.DataReadingUncached)
        
  
        
        let dict : AnyObject! = try? NSPropertyListSerialization.propertyListWithData(data, options: NSPropertyListReadOptions.init(rawValue: 0),format: nil)
        
        if (dict != nil) {
            if let ocDictionary = dict as? NSDictionary {
                var swiftDict : Dictionary<String,String> = Dictionary<String, String>()
                for key : AnyObject in ocDictionary.allKeys{
                    let stringKey : String = key as! String
                    
                    if let keyValue : AnyObject = ocDictionary.valueForKey(stringKey){
                        swiftDict[stringKey] = keyValue as? String
                    }
                }
                return swiftDict
            } else {
                return nil
            }
        } else  {
            print("Sorry, couldn't read the file \(filePath.stringByRemovingPercentEncoding):\n\t")
        }
        return nil
    }
    
    
    
    }

