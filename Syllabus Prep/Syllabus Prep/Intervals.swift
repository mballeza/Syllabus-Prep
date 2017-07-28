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
    let minorsecond = ("minorsecond", Int8(1))
    let majorsecond = ("majorsecond", Int8(2))
    let minorthird = ("minorthird", Int8(3))
    let majorthird = ("majorthird", Int8(4))
    let perfectfourth = ("perfectfourth", Int8(5))
    let augmentedfourth = ("augmentedfourth", Int8(6))
    let tritone = ("tritone", Int8(6))
    let diminishedfifth = ("diminishedfifth", Int8(6))
    let perfectfifth = ("perfectfifth", Int8(7))
    let augmentedfifth = ("augmentedfifth", Int8(8))
    let minorsixth = ("minorsixth", Int8(8))
    let majorsixth = ("majorsixth", Int8(9))
    let minorseventh = ("minorseventh", Int8(10))
    let majorseventh = ("majorseventh",  Int8(11))
    let octave = ("octave", Int8(12))
}
