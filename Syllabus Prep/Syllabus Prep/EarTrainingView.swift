//
//  EarTrainingView.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/25/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import UIKit

class EarTrainingView: UIViewController {
    var sampler:MIDISampler!
    var earTraining : EarTraining!
    var viewTitle = ""
    var level = 0
    var answerSubmitted = ""
    var segmentSelected = 0
    
    @IBOutlet weak var typeSelection: UISegmentedControl!
    @IBOutlet weak var answerChoice1: UIButton!
    @IBOutlet weak var answerChoice2: UIButton!
    @IBOutlet weak var answerChoice3: UIButton!
    @IBOutlet weak var answerChoice4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = viewTitle
        self.sampler = MIDISampler()
        typeSelection.setTitle("Intervals", forSegmentAt: 0)
        typeSelection.setTitle("Chords", forSegmentAt: 1)
        typeSelection.setTitle("Both", forSegmentAt: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enableAllAnswerButtons() {
        answerChoice1.isEnabled = true
        answerChoice2.isEnabled = true
        answerChoice3.isEnabled = true
        answerChoice4.isEnabled = true
        answerChoice1.isSelected = false
        answerChoice2.isSelected = false
        answerChoice3.isSelected = false
        answerChoice4.isSelected = false
    }
    
    func setAllAnswerButtonColor() {
        answerChoice1.backgroundColor = UIColor.blue
        answerChoice2.backgroundColor = UIColor.blue
        answerChoice3.backgroundColor = UIColor.blue
        answerChoice4.backgroundColor = UIColor.blue
    }
    
    @IBAction func updateAnswerSubmitted(_ sender: UIButton) {
        enableAllAnswerButtons()
        answerSubmitted = (sender.titleLabel?.text)!
        sender.isEnabled = false
        sender.isSelected = true
    }
    
    @IBAction func playTestQuestion(_ sender: UIButton) {
        earTraining = EarTraining(level: self.level)
        earTraining.giveTestQuestion(sampler: self.sampler)
        setAllAnswerButtonColor()
        enableAllAnswerButtons()
        answerChoice1.setTitle("abc1", for: UIControlState.normal)
        answerChoice2.setTitle("abc2", for: UIControlState.normal)
        answerChoice3.setTitle("abc3", for: UIControlState.normal)
        answerChoice4.setTitle("abc4", for: UIControlState.normal)
    }
    
    @IBAction func submitAnswer(_ sender: UIButton) {
        var alertMessage = ""
        if answerSubmitted == "abc3" {
            alertMessage = "Correct!"
        } else {
            alertMessage = "Incorrect"
        }
        let alertController = UIAlertController(title: "Answer", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        present(alertController, animated: true, completion: nil)
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
