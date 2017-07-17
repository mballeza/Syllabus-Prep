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
    var earTraining : EarTraining!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.sampler = MIDISampler()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playLevelOne(_ sender: UIButton) {
        self.earTraining = EarTraining(level: 1)
        self.earTraining.giveTestQuestion(sampler: self.sampler)
    }
    
    @IBAction func playLevelTwo(_ sender: UIButton) {
        self.earTraining = EarTraining(level: 2)
        self.earTraining.giveTestQuestion(sampler: self.sampler)
    }
    
    @IBAction func playLevelThree(_ sender: UIButton) {
        self.earTraining = EarTraining(level: 3)
        self.earTraining.giveTestQuestion(sampler: self.sampler)
    }
    
    @IBAction func playLevelFour(_ sender: UIButton) {
        self.earTraining = EarTraining(level: 4)
        self.earTraining.giveTestQuestion(sampler: self.sampler)
    }
    
    @IBAction func playLevelFive(_ sender: UIButton) {
        self.earTraining = EarTraining(level: 5)
        self.earTraining.giveTestQuestion(sampler: self.sampler)
    }
    
    @IBAction func playLevelSix(_ sender: UIButton) {
        self.earTraining = EarTraining(level: 6)
        self.earTraining.giveTestQuestion(sampler: self.sampler)
    }
    
    @IBAction func playLevelSeven(_ sender: UIButton) {
        self.earTraining = EarTraining(level: 7)
        self.earTraining.giveTestQuestion(sampler: self.sampler)
    }
    
    @IBAction func playLevelEight(_ sender: UIButton) {
        self.earTraining = EarTraining(level: 8)
        self.earTraining.giveTestQuestion(sampler: self.sampler)
    }
    
    @IBAction func playLevelNine(_ sender: UIButton) {
        self.earTraining = EarTraining(level: 9)
        self.earTraining.giveTestQuestion(sampler: self.sampler)
    }
    
    @IBAction func playLevelTen(_ sender: UIButton) {
        self.earTraining = EarTraining(level: 10)
        self.earTraining.giveTestQuestion(sampler: self.sampler)
    }
    
}

