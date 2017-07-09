//
//  ViewController.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/9/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playTestAudio(_ sender: UIButton) {
        let player = Sound()
        
        print("Reading file")
        player.readFileIntoAVPlayer()
        while(player.avPlayer.isPlaying){}
        print("Stopping file")
        player.stopAVPlayer()
    }
}

