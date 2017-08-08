//
//  Intervals.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//  This software is released under the "Apache 2.0 License".
//  Please see the file LICENSE in the source distribution of
//  this software for license terms.

import Foundation

// All intervals from minor second to octave. These are structured as a
//  tuple of a String and an Int8 array. The String describes what the
//  Interval type is, and is for answer verification when a user is given a
//  test question. The Int8 value represents the number of half steps
//  between the first note and the second note.
//
// Please do not modify, add, or remove variables unless the following reasons occur:
//  -Half-step values are incorrect.
//  -OMTA requirements change.
//  -The entire Western Music Theory world suddenly encounters a time vortex
//   and the names and half-step values are changed.
struct Intervals {
    let minorsecond: (setTuple) = (INTERVAL_NAMES.minorsecond, [1])
    let majorsecond: (setTuple) = (INTERVAL_NAMES.majorsecond, [2])
    let minorthird: (setTuple) = (INTERVAL_NAMES.minorthird, [3])
    let majorthird: (setTuple) = (INTERVAL_NAMES.majorthird, [4])
    let perfectfourth: (setTuple) = (INTERVAL_NAMES.perfectfourth, [5])
    let augmentedfourth: (setTuple) = (INTERVAL_NAMES.augmentedfourth, [6])
    let tritone: (setTuple) = (INTERVAL_NAMES.tritone, [6])
    let diminishedfifth: (setTuple) = (INTERVAL_NAMES.diminishedfifth, [6])
    let perfectfifth: (setTuple) = (INTERVAL_NAMES.perfectfifth, [7])
    let augmentedfifth: (setTuple) = (INTERVAL_NAMES.augmentedfifth, [8])
    let minorsixth: (setTuple) = (INTERVAL_NAMES.minorsixth, [8])
    let majorsixth: (setTuple) = (INTERVAL_NAMES.majorsixth, [9])
    let minorseventh: (setTuple) = (INTERVAL_NAMES.minorseventh, [10])
    let majorseventh: (setTuple) = (INTERVAL_NAMES.majorseventh, [11])
    let octave: (setTuple) = (INTERVAL_NAMES.octave, [12])
}
