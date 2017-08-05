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
    let major : (setTupleArray) = (SCALE_NAMES.major, [2, 2, 1, 2, 2, 2, 1, -1, -2, -2, -2, -1, -2, -2])
    let naturalminor : (setTupleArray) = (SCALE_NAMES.naturalminor, [2, 1, 2, 2, 1, 2, 2, -2, -2, -1, -2, -2, -1, -2])
    let harmonicminor : (setTupleArray) = (SCALE_NAMES.harmonicminor, [2, 1, 2, 2, 1, 3, 1, -1, -3, -1, -2, -2, -1, -2])
    let melodicminor : (setTupleArray) = (SCALE_NAMES.melodicminor, [2, 1, 2, 2, 2, 2, 1, -2, -2, -1, -2, -2, -1, -2])
    let wholetone : (setTupleArray) = (SCALE_NAMES.wholetone, [2, 2, 2, 2, 2, 2, -2, -2, -2, -2, -2, -2])
    let chromatic : (setTupleArray) = (SCALE_NAMES.chromatic, [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
    let dorian : (setTupleArray) = (SCALE_NAMES.dorian, [2, 1, 2, 2, 2, 1, 2, -2, -1, -2, -2, -2, -1, -2])
    let phrygian : (setTupleArray) = (SCALE_NAMES.phrygian, [1, 2, 2, 2, 1, 2, 2, -2, -2, -1, -2, -2, -2, -1])
    let lydian : (setTupleArray) = (SCALE_NAMES.lydian, [2, 2, 2, 1, 2, 2, 1, -1, -2, -2, -1, -2, -2, -2])
    let mixolydian : (setTupleArray) = (SCALE_NAMES.mixolydian, [2, 2, 1, 2, 2, 1, 2, -2, -1, -2, -2, -1, -2, -2])
    let locrian : (setTupleArray) = (SCALE_NAMES.locrian, [1, 2, 2, 1, 2, 2, 2, -2, -2, -2, -1, -2, -2, -1])
}
