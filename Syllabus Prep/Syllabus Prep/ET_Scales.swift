//
//  ET_Scales.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

// Ear Training Scales. This class contains a set of Scales. Currently
//  there are two functions: isEmpty() and getSet(). The former returns
//  true if the Scales set is empty, and the latter returns an array from
//  a random scale tuple.

class ET_Scales : EAR_TRAINING_TYPE {
    var scales : [(String, [Int8])]!
    
    override init() {
        super.init()
        scales = []
    }
    
    init(set:  [(String, [Int8])]) {
        super.init(name: "scale")
        scales = set
    }
    
	// Returns true if class was not initialized with a nonempty scale set.
	// Returns false otherwise.
    override func isEmpty() -> Bool {
        return scales!.count == 0
    }
    
	// Returns a random array from a Scale tuple.
    override func getSet() -> [Int8] {
        return self.scales![RandNum().getRandNum(mod: self.scales!.count)].1
    }
    
    override func getSet() -> setTupleArray {
        return self.scales![RandNum().getRandNum(mod: self.scales!.count)]
    }
}
