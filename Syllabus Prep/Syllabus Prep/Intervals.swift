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
    let minorsecond = ("Minor 2nd", Int8(1))
    let majorsecond = ("Major 2nd", Int8(2))
    let minorthird = ("Minor 3rd", Int8(3))
    let majorthird = ("Major 3rd", Int8(4))
    let perfectfourth = ("Perfect 4th", Int8(5))
    let augmentedfourth = ("Augmented 4th", Int8(6))
    let tritone = ("Tritone", Int8(6))
    let diminishedfifth = ("Diminished 5th", Int8(6))
    let perfectfifth = ("Perfect 5th", Int8(7))
    let augmentedfifth = ("Augmented 5th", Int8(8))
    let minorsixth = ("Minor 6th", Int8(8))
    let majorsixth = ("Major 6th", Int8(9))
    let minorseventh = ("Minor 7th", Int8(10))
    let majorseventh = ("Major 7th",  Int8(11))
    let octave = ("Octave", Int8(12))
}
