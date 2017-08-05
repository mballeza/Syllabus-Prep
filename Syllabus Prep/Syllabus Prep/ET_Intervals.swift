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
    var intervalSet : [setTuple]!
    
    override init() {
        super.init()
        self.intervalSet = []
    }
    
    init(set: [(String, Int8)]) {
        super.init(name: ETT_NAMES.interval)
        self.intervalSet = set
    }
    
	// Returns true if class was not initialized with a nonempty interval set.
	// Returns false otherwise.
    override func isEmpty() -> Bool {
        return intervalSet!.count == 0
    }
    
	// Returns a random Int value from a Interval tuple.
    override func getInterval() -> Int8 {
        return self.intervalSet![RandNum().getRandNum(mod: self.intervalSet!.count)].value
    }
    
    override func getInterval() -> setTuple  {
        return self.intervalSet![RandNum().getRandNum(mod: self.intervalSet!.count)]
    }
}
