//
//  EarTrainingSets.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

struct EAR_TRAINING_TYPE_VALUES{
	let interval = 0
	let chord = 1
	let scale = 2
}

let setIntervals = Intervals()
let setChords = Chords()
let setScales = Scales()

// This stores all 10 levels of the ear training portion of the syllabus. The information for each
//   level requirement was taken from the OMTA Piano Syllabus Levels I-X 2012 Version B book.
struct EAR_TRAINING_LEVEL_SETS {
    let one = EAR_TRAINING_SETS(intervalset: [], chordset: [setChords.majortriad, setChords.minortriad], scaleset: [])
    
    let two = EAR_TRAINING_SETS(intervalset: [setIntervals.majorthird, setIntervals.minorthird], chordset: [setChords.majortriad, setChords.minortriad], scaleset: [])

    let three = EAR_TRAINING_SETS(intervalset: [setIntervals.majorsecond, setIntervals.minorsecond], chordset: [], scaleset: [setScales.naturalminor, setScales.harmonicminor, setScales.melodicminor, setScales.wholetone, setScales.chromatic])

    let four = EAR_TRAINING_SETS(intervalset: [setIntervals.perfectfourth, setIntervals.perfectfifth], chordset: [], scaleset: [setScales.lydian, setScales.mixolydian])

    let five = EAR_TRAINING_SETS(intervalset: [setIntervals.majorsixth, setIntervals.minorsixth], chordset: [], scaleset: [setScales.dorian, setScales.phrygian])

    let six = EAR_TRAINING_SETS(intervalset: [setIntervals.majorseventh, setIntervals.minorseventh, setIntervals.tritone], chordset: [], scaleset: [setScales.locrian, setScales.wholetone, setScales.chromatic])
    
    let seven = EAR_TRAINING_SETS(intervalset: [], chordset: [setChords.majortriad, setChords.minortriad, setChords.diminishedtriad, setChords.augmentedtriad], scaleset: [])
    
    let eight = EAR_TRAINING_SETS(intervalset: [setIntervals.majorsecond, setIntervals.minorsecond, setIntervals.majorthird, setIntervals.minorthird, setIntervals.perfectfourth, setIntervals.tritone], chordset: [], scaleset: [])
    
    let nine = EAR_TRAINING_SETS(intervalset: [setIntervals.majorsixth, setIntervals.minorsixth, setIntervals.majorseventh, setIntervals.minorseventh, setIntervals.perfectfifth, setIntervals.octave], chordset: [], scaleset: [])
    
    let ten = EAR_TRAINING_SETS(intervalset: [setIntervals.majorsecond, setIntervals.minorsecond,setIntervals.majorthird, setIntervals.minorthird, setIntervals.majorsixth, setIntervals.minorsixth, setIntervals.majorseventh, setIntervals.minorseventh, setIntervals.augmentedfourth, setIntervals.augmentedfifth, setIntervals.diminishedfifth, setIntervals.perfectfourth, setIntervals.perfectfifth, setIntervals.tritone, setIntervals.octave], chordset: [], scaleset: [])
} 

// This stores String arrays of the modes and types in a particular ear training type (interval,
//   chord, or scale). The indexes of the two arrays are accessed at random by EarTraining for
//   a test question.
class EAR_TRAINING_TYPE {
	var name : String

	init() {
		self.name = ""
	}

	init(name: String) {
		self.name = name
	}

	// Returns true if mode is empty.
	func isEmpty() -> Bool {
		return name == ""
	}
}

// This stores all three ear training types.
class EAR_TRAINING_SETS {
    let intervals : ET_Intervals
    let chords : ET_Chords
    let scales : ET_Scales

	init() {
        self.intervals = ET_Intervals()
        self.chords = ET_Chords()
        self.scales = ET_Scales()
	}
/*
	init(intervalmode : [String], interval : [String], chordmode : [String], chord : [String], scalemode : [String]) {
        self.intervals = ET_Intervals()
		self.INTERVALS = EAR_TRAINING_TYPE(mode: intervalmode, type: interval)
		self.CHORDS = EAR_TRAINING_TYPE(mode: chordmode, type: chord)
		self.SCALES = EAR_TRAINING_TYPE(mode: scalemode, type: [])
	}
 */
    
    init(intervalset : [(String, Int8)], chordset : [(String, [Int8])], scaleset : [(String, [Int8])]) {
        self.intervals = ET_Intervals(set: intervalset)
        self.chords = ET_Chords(set: chordset)
        self.scales = ET_Scales(set: scaleset)
    }
/*
	func displaySetChoices() {
		if !self.INTERVALS.isEmpty() {
			print(String(EAR_TRAINING_TYPE_VALUES().interval) + ": " + EAR_TRAINING_TYPE_NAMES().interval)
		}
		if !self.CHORDS.isEmpty() {
			print(String(EAR_TRAINING_TYPE_VALUES().chord) + ": " + EAR_TRAINING_TYPE_NAMES().chord)
		}
		if !self.SCALES.isEmpty() {
			print(String(EAR_TRAINING_TYPE_VALUES().scale) + ": " + EAR_TRAINING_TYPE_NAMES().scale)
		}
	}
 */
}

