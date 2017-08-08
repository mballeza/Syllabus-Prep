//
//  ET_Intervals.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

// Ear Training Intervals. This class contains a set of Intervals. Currently
//  there are two functions: isEmpty() and getInterval(). The former returns
//  true if the Interval set is empty, and the latter returns an Int from
//  a random Interval tuple.

class ET_Intervals : EAR_TRAINING_TYPE {
    override init() {
        super.init()
    }
    
    init(set: [setTuple]) {
        super.init()
        self.name = ETT_NAMES.interval
        self.noteSets = set
    }
}
