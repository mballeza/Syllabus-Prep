//
//  Chords.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

// Major, minor, diminished, and augmented triads. These are structured as
//  a tuple of a String and an Int8 array. The String describes what the
//  Chord type is, and is for answer verification when a user is given a
//  test question. The array contains 2 Int8 values: the value of the 
//  interval between root and third, and the value of the interval between
//  root and fifth.

struct Chords {
    let minortriad : (setTuple) = (CHORD_NAMES.minortriad, [3, 7])
    let majortriad : (setTuple) = (CHORD_NAMES.majortriad, [4, 7])
    let diminishedtriad : (setTuple) =  (CHORD_NAMES.diminishedtriad, [3, 6])
    let augmentedtriad : (setTuple) = (CHORD_NAMES.augmentedtriad, [4, 8])
}
