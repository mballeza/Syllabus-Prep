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
    let major : (String, [Int8]) = ("Major", [2, 2, 1, 2, 2, 2, 1, -1, -2, -2, -2, -1, -2, -2])
    let naturalminor : (String, [Int8]) = ("Natural Minor", [2, 1, 2, 2, 1, 2, 2, -2, -2, -1, -2, -2, -1, -2])
    let harmonicminor : (String, [Int8]) = ("Harmonic Minor", [2, 1, 2, 2, 1, 3, 1, -1, -3, -1, -2, -2, -1, -2])
    let melodicminor : (String, [Int8]) = ("Melodic Minor", [2, 1, 2, 2, 2, 2, 1, -2, -2, -1, -2, -2, -1, -2])
    let wholetone : (String, [Int8]) = ("Wholetone", [2, 2, 2, 2, 2, 2, -2, -2, -2, -2, -2, -2])
    let chromatic : (String, [Int8]) = ("Chromatic", [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
    let dorian : (String, [Int8]) = ("Dorian", [2, 1, 2, 2, 2, 1, 2, -2, -1, -2, -2, -2, -1, -2])
    let phrygian : (String, [Int8]) = ("Phrygian", [1, 2, 2, 2, 1, 2, 2, -2, -2, -1, -2, -2, -2, -1])
    let lydian : (String, [Int8]) = ("Lydian", [2, 2, 2, 1, 2, 2, 1, -1, -2, -2, -1, -2, -2, -2])
    let mixolydian : (String, [Int8]) = ("Mixolydian", [2, 2, 1, 2, 2, 1, 2, -2, -1, -2, -2, -1, -2, -2])
    let locrian : (String, [Int8]) = ("Locrian", [1, 2, 2, 1, 2, 2, 2, -2, -2, -2, -1, -2, -2, -1])
}
