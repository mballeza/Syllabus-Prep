//
//  ET_Scales.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//  This software is released under the "Apache 2.0 License".
//  Please see the file LICENSE in the source distribution of
//  this software for license terms.

import Foundation

// Ear Training Scales. This class contains a set of Scales. Currently
//  there are two functions: isEmpty() and getSet(). The former returns
//  true if the Scales set is empty, and the latter returns an array from
//  a random scale tuple.

class ET_Scales : EAR_TRAINING_TYPE {
    override init() {
        super.init()
    }
    
    init(set:  [setTuple]) {
        super.init()
        self.name = ETT_NAMES.scale
        self.noteSets = set
    }
}
