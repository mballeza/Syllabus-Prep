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
    var viewTitle = ""              // UIView title
    var level = 0                   // Current Syllabus level
    var answerSubmitted = ""        // String from answer button title
    var segmentSelected = 0
    
    // MARK: - Outlets
    
    @IBOutlet weak var typeSelection: UISegmentedControl!
    
    @IBOutlet weak var answerChoice1: UIButton!
    @IBOutlet weak var answerChoice2: UIButton!
    @IBOutlet weak var answerChoice3: UIButton!
    @IBOutlet weak var answerChoice4: UIButton!
    var answerButtons: [UIButton]!  // For ease of changing settings for all answer buttons
   
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.title = viewTitle               // Load given title
        
        // Hack, erases all segments in order to generate the correct titles for each
        //  Syllabus level.
        typeSelection.removeSegment(at: 0, animated: false) // Erases first segment of two
        typeSelection.removeSegment(at: 0, animated: false) // Erases last segment
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.sampler = MIDISampler()                    // Init MIDI
        earTraining = EarTraining(level: self.level)    // Init Syllabus level
        setTypeSelectionButtons(set: earTraining)           // Generates the correct titles
        
        self.answerButtons = [answerChoice1, answerChoice2, answerChoice3, answerChoice4]
        
        self.playButton.isEnabled = false
        self.playButton.isHidden = true
        self.submitButton.isEnabled = false
        self.submitButton.isHidden = true
    }
    
    // Generates the correct titles for the current Syllabus level. As per the OMTA requirements,
    //  there can only be 1 or 2 total types out of the 3 (intervals, chords, scales).
    func setTypeSelectionButtons(set:EarTraining) {
        let scaleEmpty = set.playSet.scales.isEmpty()
        let chordEmpty = set.playSet.chords.isEmpty()
        let intervalEmpty = set.playSet.intervals.isEmpty()
        
        // If there are 2 total types, push a "Both" button.
        if (!scaleEmpty && !chordEmpty) || (!scaleEmpty && !intervalEmpty) || (!chordEmpty && !intervalEmpty) {
            typeSelection.insertSegment(withTitle: "Both", at: 0, animated: false)
        }
        
        // Push a "Scales" button
        if !scaleEmpty {
            typeSelection.insertSegment(withTitle: "Scales", at: 0, animated: false)
        }
        // Push a "Chords" button
        if !chordEmpty {
            typeSelection.insertSegment(withTitle: "Chords", at: 0, animated: false)
        }
        // Push an "Intervals" button
        if !intervalEmpty {
            typeSelection.insertSegment(withTitle: "Intervals", at: 0, animated: false)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enableAllAnswerButtons() {
        for i in answerButtons {
            i.isEnabled = true
            i.isSelected = false
            
            i.layer.cornerRadius = 2
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.black.cgColor
        }
        submitButton.isEnabled = true
        submitButton.isHidden = false
        
        submitButton.layer.cornerRadius = 2
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func setAllAnswerButtonColor() {
        for i in answerButtons {
            i.backgroundColor = UIColor.blue    // Blue color for now
        }
    }
    
    func getEarTrainingValueFromSegmentTitle(title: String) -> Int {
        var ETTValue: Int!
        
        switch title {
        case "Intervals":
            ETTValue = EAR_TRAINING_TYPE_VALUES().interval
        case "Chords":
            ETTValue = EAR_TRAINING_TYPE_VALUES().chord
        case "Scales":
            ETTValue = EAR_TRAINING_TYPE_VALUES().scale
        default:
            ETTValue = -1
        }
        
        return ETTValue
    }
    
    // MARK: - Actions
    
    @IBAction func enableBottomView(_ sender: UISegmentedControl) {
        playButton.isEnabled = true
        playButton.isHidden = false
        
        playButton.layer.cornerRadius = 2
        playButton.layer.borderWidth = 1
        playButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func updateAnswerSubmitted(_ sender: UIButton) {
        enableAllAnswerButtons()
        answerSubmitted = (sender.titleLabel?.text)!
        sender.isEnabled = false
        sender.isSelected = true
    }
    
    @IBAction func playTestQuestion(_ sender: UIButton) {
        var typeChoice:Int!
        var playSet: EAR_TRAINING_TYPE!
        
        if typeSelection.selectedSegmentIndex < 2 {
            typeChoice = getEarTrainingValueFromSegmentTitle(title: typeSelection.titleForSegment(at: typeSelection.selectedSegmentIndex)!)
            
            playSet = earTraining.getEarTrainingPlaySet(ETTValue: typeChoice)
            
            if playSet.isEmpty() {
                print("Could not send valid Ear Training Type Value.")
                print("MIDI sampler cannot play")
                return
            }
        } else {
            playSet = earTraining.getRandomEarTrainingPlaySet()
        }
        
        earTraining.playTestQuestion(sampler: self.sampler, choice: typeChoice, playSet: playSet)
        
        //setAllAnswerButtonColor()
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
