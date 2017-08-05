//
//  Intervals.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

// All intervals from minor second to octave. These are structured as a
//  tuple of a String and an Int8. The String describes what the
//  Interval type is, and is for answer verification when a user is given a
//  test question. The Int8 value represents the number of half steps
//  between the first note and the second note.

struct Intervals {
    let minorsecond: (String, Int8) = (INTERVAL_NAMES.minorsecond, 1)
    let majorsecond: (String, Int8) = (INTERVAL_NAMES.majorsecond, 2)
    let minorthird: (String, Int8) = (INTERVAL_NAMES.minorthird, 3)
    let majorthird: (String, Int8) = (INTERVAL_NAMES.majorthird, 4)
    let perfectfourth: (String, Int8) = (INTERVAL_NAMES.perfectfourth, 5)
    let augmentedfourth: (String, Int8) = (INTERVAL_NAMES.augmentedfourth, 6)
    let tritone: (String, Int8) = (INTERVAL_NAMES.tritone, 6)
    let diminishedfifth: (String, Int8) = (INTERVAL_NAMES.diminishedfifth, 6)
    let perfectfifth: (String, Int8) = (INTERVAL_NAMES.perfectfifth, 7)
    let augmentedfifth: (String, Int8) = (INTERVAL_NAMES.augmentedfifth, 8)
    let minorsixth: (String, Int8) = (INTERVAL_NAMES.minorsixth, 8)
    let majorsixth: (String, Int8) = (INTERVAL_NAMES.majorsixth, 9)
    let minorseventh: (String, Int8) = (INTERVAL_NAMES.minorseventh, 10)
    let majorseventh: (String, Int8) = (INTERVAL_NAMES.majorseventh, 11)
    let octave: (String, Int8) = (INTERVAL_NAMES.octave, 12)
}
