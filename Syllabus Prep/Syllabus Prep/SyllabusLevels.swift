//
//  SyllabusLevels.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation
import Darwin

let ETT_NAMES = EAR_TRAINING_TYPE_NAMES()
let ETT_VALUES = EAR_TRAINING_TYPE_VALUES()
let EAR_TRAINING_LEVELS = EAR_TRAINING_LEVEL_SETS()
let NUM_EAR_TRAINING_SETS = 3 		// Only 3: intervals, chords, scales.
let NUM_FILE_ENTRY = 3				// Number of lines in a file. Only 3 for now for demo purposes.
let MAX_LEVEL = 10					// Max syllabus level
let MIN_LEVEL = 1					// Min syllabus level

class SyllabusLevels {
	fileprivate var TypeLevel : Types			// The type for the current study session
	fileprivate var playSet : EAR_TRAINING_SETS	// This is for ear training only, contains the requirement sets 
									//   for each level

	init() {
		self.TypeLevel = Types()
		self.playSet = EAR_TRAINING_SETS()
	}

	// Asserts the level is between 1 and 10
	func assertLevel(level: Int) -> Bool {
		let isValid = level >= MIN_LEVEL && level <= MAX_LEVEL

		if !isValid {
			print("Invalid level")
		}
		return isValid
	}

	func giveTestQuestion() {
/*
		let numTypes = TypeLevel.count

		srandom(UInt32(time(nil)))

#if os(Linux)
		let randnum = random() % numTypes 
		let randidx = random() % NUM_FILE_ENTRY
#else
		let randnum = Int(arc4random()) % numTypes 
		let randidx = Int(arc4random()) % NUM_FILE_ENTRY
#endif

		let CurrentLevel = TypeLevel[0]
		let CurrentKey = TypeLevel[1]
		CurrentLevel[randnum].readEntry(index: randidx)

		#if AUDIO
		print("Playing test mp3 file, please wait 16 seconds")
		sleep(1)
		let rc = CurrentLevel.playAudio()
		if rc == 0 {
			print("Playback successful")
		} else {
			print("Playback unsuccessful")
		}
		#endif

		queryType()
*/
	}

	func giveTestQuestion(choice: Int) {
	}

	fileprivate func queryType() {
		print("DEFAULT: should not display")
	}

	fileprivate func setRandSeed() {
		srandom(UInt32(time(nil)))
	}

	fileprivate func getRandIndex(mod: Int) -> Int {
#if os(Linux)
		return random() % mod
#else
		return Int(arc4random()) % mod
#endif
	}

	func displayChoices() {
	}
}

class EarTraining: SyllabusLevels {
	fileprivate var stringType : String?	// Hack, used in queryType. ETT_NAMES.interval, ETT_NAMES.chord, or ETT_NAMES.scale

	init(level: Int) {
		super.init()

		// Syllabus levels
		switch level {
			case 1: self.playSet = EAR_TRAINING_LEVELS.one
			case 2: self.playSet = EAR_TRAINING_LEVELS.two
			case 3: self.playSet = EAR_TRAINING_LEVELS.three
			case 4: self.playSet = EAR_TRAINING_LEVELS.four
			case 5: self.playSet = EAR_TRAINING_LEVELS.five
			case 6: self.playSet = EAR_TRAINING_LEVELS.six
			case 7: self.playSet = EAR_TRAINING_LEVELS.seven
			case 8: self.playSet = EAR_TRAINING_LEVELS.eight
			case 9: self.playSet = EAR_TRAINING_LEVELS.nine
			case 10: self.playSet = EAR_TRAINING_LEVELS.ten

			default: self.playSet = EAR_TRAINING_SETS()
		}

		setRandSeed()
	}

	// Generates random indexes to access the Type set. Returns a Types object.
	fileprivate func createType(set: EAR_TRAINING_TYPE, setType: String) -> Types {
		let modeCount = set.mode.count
		let typeCount = set.type.count
		var mode = ""
		var type = ""
		var isValid = 1

		repeat {
			if !set.isEmpty() {
				mode = set.mode[getRandIndex(mod: modeCount)]
				if !set.isScale() {
					type = set.type[getRandIndex(mod: typeCount)]
				}
			}

			// Hack. Checks if interval.
			if setType == ETT_NAMES.interval {
				isValid = set.isValidInterval(mode: mode, type: type)

				// If interval and is tritone or octave type.
				if isValid == -1 {
					type = ""
				}
			}
		} while (setType == ETT_NAMES.interval && isValid == 0)

		return Types(mode: mode, type: type) 
	}

	// Retrieves a randomly generated Types class.
	override func giveTestQuestion() {
		var randSetNum : Int
		var earTrainingPlaySet = EAR_TRAINING_TYPE()

		repeat {
			randSetNum = getRandIndex(mod : NUM_EAR_TRAINING_SETS)

			switch randSetNum {
				case ETT_VALUES.interval: 
						earTrainingPlaySet = playSet.INTERVALS
						if !earTrainingPlaySet.isEmpty() {
							stringType = ETT_NAMES.interval
							TypeLevel = createType(set: earTrainingPlaySet, setType: stringType!)
						}
				case ETT_VALUES.chord: 
						earTrainingPlaySet = playSet.CHORDS
						if !earTrainingPlaySet.isEmpty() {
							stringType = ETT_NAMES.chord
							TypeLevel = createType(set: earTrainingPlaySet, setType: stringType!)
						}
				case ETT_VALUES.scale: 
						earTrainingPlaySet = playSet.SCALES
						if !earTrainingPlaySet.isEmpty() {
							stringType = ETT_NAMES.scale
							TypeLevel = createType(set: earTrainingPlaySet, setType: stringType!)
						}
				default: 
						TypeLevel = Types()
			}
		} while earTrainingPlaySet.isEmpty() 

		if TypeLevel.readEntry(index: getRandIndex(mod: NUM_FILE_ENTRY)) {
			queryType()
		}
	}

	func isValidSet(choice : Int) -> Bool {
		var earTrainingPlaySet : EAR_TRAINING_TYPE
		switch choice {
			case ETT_VALUES.interval: 
					earTrainingPlaySet = playSet.INTERVALS
			case ETT_VALUES.chord: 
					earTrainingPlaySet = playSet.CHORDS
			case ETT_VALUES.scale: 
					earTrainingPlaySet = playSet.SCALES
			default: 
					earTrainingPlaySet = EAR_TRAINING_TYPE()
		}

		if earTrainingPlaySet.isEmpty() {
			print("invalid value")
			return false
		}

		return true
	}

	override func giveTestQuestion(choice: Int) {
		var earTrainingPlaySet = EAR_TRAINING_TYPE()

		switch choice {
			case ETT_VALUES.interval: 
					earTrainingPlaySet = playSet.INTERVALS
					if !earTrainingPlaySet.isEmpty() {
						stringType = ETT_NAMES.interval
						TypeLevel = createType(set: earTrainingPlaySet, setType: stringType!)
					}
			case ETT_VALUES.chord: 
					earTrainingPlaySet = playSet.CHORDS
					if !earTrainingPlaySet.isEmpty() {
						stringType = ETT_NAMES.chord
						TypeLevel = createType(set: earTrainingPlaySet, setType: stringType!)
					}
			case ETT_VALUES.scale: 
					earTrainingPlaySet = playSet.SCALES
					if !earTrainingPlaySet.isEmpty() {
						stringType = ETT_NAMES.scale
						TypeLevel = createType(set: earTrainingPlaySet, setType: stringType!)
					}
			default: 
					TypeLevel = Types()
		}

		if TypeLevel.readEntry(index: getRandIndex(mod: NUM_FILE_ENTRY)) {
			queryType()
		}
	}

	// Asks the user to enter the mode of the interval/chord/scale given.
	override func queryType() {
		print("Enter the " + stringType! + " mode")
		let response = readLine()
		if TypeLevel.isCorrectType(guess: response!.lowercased()) {
			print("Correct!")
		} else {
			print("Incorrect!")
		}
	}

	override func displayChoices() {
		playSet.displaySetChoices() 
	}
}
