//
//  ViewController.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/9/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var sampler:MIDISampler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.sampler = MIDISampler()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playMajorScale(_ sender: UIButton) {
        self.sampler.playMajorScale()
    }
    
}

