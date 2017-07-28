//
//  Scales.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

// All modes (major is ionian, natural minor is aeolian). These are
//  structured as a tuple of a String and an Int8 array. The String
//  describes what the Scale type is. The array contains a set of 
//  interval values between each subsequent note. The first half of
//  the array contains positive values (going up the scale) and the
//  second half contains negative values (going down the scale). All
//  scales are the same up and down except for melodic minor, where the
//  scale going down is the same as natural minor.

struct Scales {
    let major : (String, [Int8]) = ("major", [2, 2, 1, 2, 2, 2, 1, -1, -2, -2, -2, -1, -2, -2])
    let naturalminor : (String, [Int8]) = ("naturalminor", [2, 1, 2, 2, 1, 2, 2, -2, -2, -1, -2, -2, -1, -2])
    let harmonicminor : (String, [Int8]) = ("harmonicminor", [2, 1, 2, 2, 1, 3, 1, -1, -3, -1, -2, -2, -1, -2])
    let melodicminor : (String, [Int8]) = ("melodicminor", [2, 1, 2, 2, 2, 2, 1, -2, -2, -1, -2, -2, -1, -2])
    let wholetone : (String, [Int8]) = ("wholetone", [2, 2, 2, 2, 2, 2, -2, -2, -2, -2, -2, -2])
    let chromatic : (String, [Int8]) = ("chromatic", [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
    let dorian : (String, [Int8]) = ("dorian", [2, 1, 2, 2, 2, 1, 2, -2, -1, -2, -2, -2, -1, -2])
    let phrygian : (String, [Int8]) = ("phrygian", [1, 2, 2, 2, 1, 2, 2, -2, -2, -1, -2, -2, -2, -1])
    let lydian : (String, [Int8]) = ("lydian", [2, 2, 2, 1, 2, 2, 1, -1, -2, -2, -1, -2, -2, -2])
    let mixolydian : (String, [Int8]) = ("mixolydian", [2, 2, 1, 2, 2, 1, 2, -2, -1, -2, -2, -1, -2, -2])
    let locrian : (String, [Int8]) = ("locrian", [1, 2, 2, 1, 2, 2, 2, -2, -2, -2, -1, -2, -2, -1])
}
