//
//  SyllabusLevels.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//  This software is released under the "Apache 2.0 License".
//  Please see the file LICENSE in the source distribution of
//  this software for license terms.

import Foundation
import Darwin

let EAR_TRAINING_LEVELS = EAR_TRAINING_LEVEL_SETS()
let NUM_EAR_TRAINING_SETS = 3 		// Only 3: intervals, chords, scales.
let MAX_LEVEL = 10					// Max syllabus level
let MIN_LEVEL = 1					// Min syllabus level

class SyllabusLevels {
    var playSet : EAR_TRAINING_SETS	// This is for ear training only, contains the requirement sets
									//   for each level

	init() {
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
}

class EarTraining: SyllabusLevels {
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

		RandNum().setRandSeed()
	}

    func getEarTrainingPlaySet(ETTValue: Int) -> EAR_TRAINING_TYPE {
        var earTrainingPlaySet: EAR_TRAINING_TYPE!
        
        switch ETTValue {
        case ETT_VALUES.interval:
            earTrainingPlaySet = playSet.intervals
        case ETT_VALUES.chord:
            earTrainingPlaySet = playSet.chords
        case ETT_VALUES.scale:
            earTrainingPlaySet = playSet.scales
        default:
            earTrainingPlaySet = EAR_TRAINING_TYPE()
        }
        
        return earTrainingPlaySet
    }
    
    func getRandomEarTrainingPlaySet() -> EAR_TRAINING_TYPE {
        var earTrainingPlaySet: EAR_TRAINING_TYPE!
        var randSetNum : Int
        
        // Keep trying until a nonempty set is assigned.
        repeat {
            randSetNum = RandNum().getRandNum(mod: NUM_EAR_TRAINING_SETS)
            
            earTrainingPlaySet = getEarTrainingPlaySet(ETTValue: randSetNum)
        } while earTrainingPlaySet.isEmpty()
        
        return earTrainingPlaySet
    }
}
