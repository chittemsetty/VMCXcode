//
//  ViewController.swift
//  Anchor
//
//  Created by Venu Chittemsetty on 4/15/16.
//  Copyright © 2016 Vedya Wonders. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let directoryContents = NSBundle.mainBundle().bundlePath
    
    
    @IBOutlet var imageView: UIView!
    var images = [NSString]()
    
    var imageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            try images = NSFileManager.defaultManager().contentsOfDirectoryAtPath(directoryContents+"/pics")
        } catch {
            
        }
    }
    @IBAction func handleSwipe(sender: UISwipeGestureRecognizer) {
    
        let direction = sender.direction
        switch direction {
        case UISwipeGestureRecognizerDirection.Left:
            print("left");
            self.imageIndex -= 1;
            break;
        case UISwipeGestureRecognizerDirection.Right:
            print("right");
            self.imageIndex += 1;
            break;
        default:
            print("other");
            break;
        }
        print(self.imageIndex);
        if (self.imageIndex < 0){
            self.imageIndex = 0;
        }
        if (self.imageIndex >= self.images.count){
            self.imageIndex = self.images.count - 1;
        }
        let iview = UIImageView(image: UIImage.init(named: self.images[self.imageIndex] as String))
        self.imageView.addSubview(iview)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

