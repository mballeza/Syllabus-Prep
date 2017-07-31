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
    let minortriad : (String, [Int8]) = ("Minor Triad", [3, 7])
    let majortriad : (String, [Int8]) = ("Major Triad", [4, 7])
    let diminishedtriad : (String, [Int8]) =  ("Diminished Triad", [3, 6])
    let augmentedtriad : (String, [Int8]) = ("Augmented Triad", [4, 8])
}
