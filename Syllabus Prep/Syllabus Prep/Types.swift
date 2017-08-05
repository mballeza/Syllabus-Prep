//
//  Types.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 8/4/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

typealias setTuple = (name: String, value: Int8)
typealias setTupleArray = (name: String, valueset: [Int8])

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
