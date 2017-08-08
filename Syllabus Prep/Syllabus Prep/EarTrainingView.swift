//
//  EarTrainingView.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/25/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//  This software is released under the "Apache 2.0 License".
//  Please see the file LICENSE in the source distribution of
//  this software for license terms.

import UIKit

class EarTrainingView: UIViewController {
    var sampler:MIDISampler!
    var earTraining : EarTraining!
    var viewTitle = ""              // UIView title
    var level = 0                   // Current Syllabus level
    var answerSubmitted = ""        // String from answer button title
    var correctAnswer = ""          // String assigned from a setTuple.name
    var segmentSelected = 0         // UISegmentedControl segment value
    
    var noteSetTuple : setTuple!    // Contains name and set of notes to play
    var currentType = -1            // Ear Training Type value
    
    let tanColor = UIColor(colorLiteralRed: 0xD0/255.0, green: 0xA6/255.0, blue: 0x72/255.0, alpha: 1.0)
    
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
            typeSelection.insertSegment(withTitle: ETT_NAMES.scale, at: 0, animated: false)
        }
        // Push a "Chords" button
        if !chordEmpty {
            typeSelection.insertSegment(withTitle: ETT_NAMES.chord, at: 0, animated: false)
        }
        // Push an "Intervals" button
        if !intervalEmpty {
            typeSelection.insertSegment(withTitle: ETT_NAMES.interval, at: 0, animated: false)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called once the play button is pressed for the first time upon entering the view.
    //  Does the following:
    //  -Enables all answer buttons
    //  -Sets the border color to black
    //  -Sets the background color to white
    func enableAllAnswerButtons() {
        for i in answerButtons {
            i.isEnabled = true
//            i.isSelected = false
            
            i.layer.cornerRadius = 2
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.black.cgColor
            i.backgroundColor = UIColor.white
        }
        submitButton.isEnabled = true   // Enable submit button
        submitButton.isHidden = false   // No more hiding
        
        submitButton.layer.cornerRadius = 2
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor.black.cgColor
        submitButton.backgroundColor = UIColor.white
    }
    
    // Sets the background color, currently not in use
    func setAllAnswerButtonColor() {
        for i in answerButtons {
            i.backgroundColor = self.tanColor
        }
    }
    
    // Returns an Ear Training Type value based on the type selected (Interval, Chord, or Scale).
    func getEarTrainingValueFromSegmentTitle(title: String) -> Int {
        var ETTValue: Int!
        
        switch title {
        case ETT_NAMES.interval:
            ETTValue = ETT_VALUES.interval
        case ETT_NAMES.chord:
            ETTValue = ETT_VALUES.chord
        case ETT_NAMES.scale:
            ETTValue = ETT_VALUES.scale
        default:
            ETTValue = -1
        }
        
        return ETTValue
    }
    
    // Called after a type is selected and the play button has been pressed.
    //  Assigns the correct answer to an array of 4 Strings. Two incorrect answers are gathered
    //  from a list of the same type. One incorrect answer is gathered from a list of fake answers.
    //  Then the array is rotated. The new 0 index starts from a random number between 0 and 3.
    //  Assigns the String values to the answer buttons.
    func updateAnswers(correctAnswer: String, answerType: String) {
        var answersArray:[String] = Array(repeating: "", count: 4)  // Initialize empty array of 4
        let randomAnswers = RandAnswer()
        
        // FIRST
        answersArray[0] = correctAnswer
        
        // Pick an answer of the same type, but not the same as the correct answer.
        repeat {
            // SECOND
            answersArray[1] = randomAnswers.getRandAnswerSameType(type: answerType)
        } while answersArray[0] == answersArray[1]
        
        // Pick an answer of the same type, but not the same as the correct answer, or the previous.
        repeat {
            // THRID
            answersArray[2] = randomAnswers.getRandAnswerSameType(type: answerType)
        } while answersArray[1] == answersArray[2] && answersArray[0] == answersArray[2]
        
        // FOURTH
        answersArray[3] = randomAnswers.getRandAnswerFakeType(type: answerType)
        
        let newAnswers = randomAnswers.rotateAnswers(answers: answersArray)
        
        self.correctAnswer = correctAnswer
        
        // Assign the String values to the answer buttons.
        for i in 0...3 {
            self.answerButtons[i].setTitle(newAnswers[i], for: UIControlState.normal)
        }
    }
    
    // MARK: - Actions
    
    // Called after play button is pressed.
    @IBAction func enableBottomView(_ sender: UISegmentedControl) {
        playButton.isEnabled = true
        playButton.isHidden = false
        
        playButton.layer.cornerRadius = 2
        playButton.layer.borderWidth = 1
        playButton.layer.borderColor = UIColor.black.cgColor
    }
    
    // Updates the answer submitted and highlights the button by setting the background color.
    @IBAction func updateAnswerSubmitted(_ sender: UIButton) {
        enableAllAnswerButtons()
        answerSubmitted = (sender.titleLabel?.text)!
        sender.isEnabled = false
        sender.backgroundColor = self.tanColor
    }
    
    // Plays a random set of notes based on the type selected (Interval, Chord, Scale).
    //  Updates the correct answer and incorrect answers to the answer buttons.
    @IBAction func playTestQuestion(_ sender: UIButton) {
        var playSet: EAR_TRAINING_TYPE!
        var correctAnswerToUpdate: String!
        
        // This if/else statement assumes that there can only be 1 or 3 UISegment buttons: one of
        //  the types, or two of the types plus a "Both" option. The if statement assumes the user
        //  wishes to play a specific type. The else statement assumes that the selected segment
        //  index must be >= 2, and will play one of the two types of the current level randomly.
        if typeSelection.selectedSegmentIndex < 2 {
            // Assign current type value based on the type selected.
            self.currentType = getEarTrainingValueFromSegmentTitle(title: typeSelection.titleForSegment(at: typeSelection.selectedSegmentIndex)!)
            
            playSet = earTraining.getEarTrainingPlaySet(ETTValue: self.currentType)
            
            if playSet.isEmpty() {
                print("Could not send valid Ear Training Type Value.")
                print("MIDI sampler cannot play")
                return
            }
            
        } else {
            playSet = earTraining.getRandomEarTrainingPlaySet()
        }
    
        do {
            try self.noteSetTuple = playSet.getRandNoteSet()
        } catch ETT_Errors.emptyNoteSet {
            print("Note set was empty! Cannot play")
        } catch {
            print("Error")
        }
        
        switch playSet.name {   // Had to use String name instead of ETT value...
        case ETT_NAMES.interval:
            sampler.playInterval(interval: noteSetTuple!.value)
        case ETT_NAMES.chord:
            sampler.playChord(chord: noteSetTuple!.value)
        case ETT_NAMES.scale:
            sampler.playScale(scale: noteSetTuple!.value)
        default:
            print("Invalid name")    // Shouldn't reach default case
            return
        }
        
        correctAnswerToUpdate = noteSetTuple!.name
        
        //setAllAnswerButtonColor()
        enableAllAnswerButtons()
        
        updateAnswers(correctAnswer: correctAnswerToUpdate, answerType: playSet.name)
    }
    
    // Can be pressed after a play set has been generated. Currently not in use.
    @IBAction func playQuestionAgain(_ sender: UIButton) {
        switch self.currentType {
        case ETT_VALUES.interval:
            self.sampler.playInterval(interval: self.noteSetTuple!.value)
        case ETT_VALUES.chord:
            self.sampler.playChord(chord: self.noteSetTuple!.value)
        case ETT_VALUES.scale:
            self.sampler.playScale(scale: self.noteSetTuple!.value)
        default:
            print("Could not play")
        }
    }
    
    @IBAction func submitAnswer(_ sender: UIButton) {
        var alertMessage = ""
        if answerSubmitted == correctAnswer {
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
