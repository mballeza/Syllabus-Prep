//
//  ET_Chords.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

// Ear Training Chords. This class contains a set of Chords. Currently
//  there are two functions: isEmpty() and getSet(). The former returns
//  true if the Chord set is empty, and the latter returns an array from
//  a random chord tuple.

class ET_Chords : EAR_TRAINING_TYPE {
    override init() {
        super.init()
    }
    
    init(set: [setTuple]) {
        super.init()
        self.name = ETT_NAMES.chord
        self.noteSets = set
    }
}
