//
//  Types.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 8/4/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//  This software is released under the "Apache 2.0 License".
//  Please see the file LICENSE in the source distribution of
//  this software for license terms.

import Foundation

// This tuple is intended for Ear Training purposes. This tuple will contain
//  a name and a set of half-step values. Int8 is used because MIDI tools 
//  require an Int8 value.
typealias setTuple = (name: String, value: [Int8])

// This is used mainly for random number access and switch cases. If a user
//  wishes to study more than one Ear Training type, RandNum is used to pick
//  an Ear Training type.
struct EAR_TRAINING_TYPE_VALUES {
    let interval = 0
    let chord = 1
    let scale = 2
}

struct EAR_TRAINING_TYPE_NAMES {
    let interval = "Interval"
    let chord = "Chord"
    let scale = "Scale"
}

let ETT_NAMES = EAR_TRAINING_TYPE_NAMES()
let ETT_VALUES = EAR_TRAINING_TYPE_VALUES()
