//
//  ET_Chords.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//  This software is released under the "Apache 2.0 License".
//  Please see the file LICENSE in the source distribution of
//  this software for license terms.

import Foundation

// Ear Training Chords. This class contains a set of Chords. This class
//  simply intializes the note set and the name as "Chord".

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
