//
//  Scales.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//  This software is released under the "Apache 2.0 License".
//  Please see the file LICENSE in the source distribution of
//  this software for license terms.

import Foundation

// All modes (major is ionian, natural minor is aeolian). These are
//  structured as a tuple of a String and an Int8 array. The String
//  describes what the Scale type is. The array contains a set of 
//  interval values between each subsequent note. The first half of
//  the array contains positive values (going up the scale) and the
//  second half contains negative values (going down the scale). All
//  scales are the same up and down except for melodic minor, where the
//  scale going down is the same as natural minor.
//
// Please do not modify, add, or remove variables unless the following reasons occur:
//  -Half-step values are incorrect.
//  -OMTA requirements change.
//  -The entire Western Music Theory world suddenly encounters a time vortex
//   and the names and half-step values are changed.
// Note that major is equivalent to ionian, and natural minor is equivalent to aeolian.
struct Scales {
    let major : (setTuple) = (SCALE_NAMES.major, [2, 2, 1, 2, 2, 2, 1, -1, -2, -2, -2, -1, -2, -2])
    let naturalminor : (setTuple) = (SCALE_NAMES.naturalminor, [2, 1, 2, 2, 1, 2, 2, -2, -2, -1, -2, -2, -1, -2])
    let harmonicminor : (setTuple) = (SCALE_NAMES.harmonicminor, [2, 1, 2, 2, 1, 3, 1, -1, -3, -1, -2, -2, -1, -2])
    let melodicminor : (setTuple) = (SCALE_NAMES.melodicminor, [2, 1, 2, 2, 2, 2, 1, -2, -2, -1, -2, -2, -1, -2])
    let wholetone : (setTuple) = (SCALE_NAMES.wholetone, [2, 2, 2, 2, 2, 2, -2, -2, -2, -2, -2, -2])
    let chromatic : (setTuple) = (SCALE_NAMES.chromatic, [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
    let dorian : (setTuple) = (SCALE_NAMES.dorian, [2, 1, 2, 2, 2, 1, 2, -2, -1, -2, -2, -2, -1, -2])
    let phrygian : (setTuple) = (SCALE_NAMES.phrygian, [1, 2, 2, 2, 1, 2, 2, -2, -2, -1, -2, -2, -2, -1])
    let lydian : (setTuple) = (SCALE_NAMES.lydian, [2, 2, 2, 1, 2, 2, 1, -1, -2, -2, -1, -2, -2, -2])
    let mixolydian : (setTuple) = (SCALE_NAMES.mixolydian, [2, 2, 1, 2, 2, 1, 2, -2, -1, -2, -2, -1, -2, -2])
    let locrian : (setTuple) = (SCALE_NAMES.locrian, [1, 2, 2, 1, 2, 2, 2, -2, -2, -2, -1, -2, -2, -1])
}
