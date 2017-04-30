//
//  ViewController.swift
//  iAdtest
//
//  Created by Venu Chittemsetty on 11/17/15.
//  Copyright © 2015 Vedya Wonders. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {

    @IBOutlet weak var adBanner: ADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.canDisplayBannerAds = true
        self.adBanner.delegate = self
        self.adBanner.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.adBanner.hidden = false
    }
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        
    }
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        
    }
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
     
        return true
    }
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        
    }
    


}

