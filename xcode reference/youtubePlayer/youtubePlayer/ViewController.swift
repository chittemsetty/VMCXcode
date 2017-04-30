//
//  ViewController.swift
//  youtubePlayer
//
//  Created by Venu Chittemsetty on 11/14/15.
//  Copyright © 2015 Vedya Wonders. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewController: UIViewController {
    var movie = AVPlayerViewController()

    @IBOutlet weak var urlStr: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playMovie(sender: UIButton) {
        let url = NSCoder.init()
        url.
        self.movie = AVPlayerViewController.init(coder: url)
        self.movie.controlStyle = MPMovieControlStyle.Default
        self.movie.shouldAutoplay = true
        self.view.addSubview(self.movie.view)
        self.movie.setFullscreen(true, animated: true)
        
        
    }

}

