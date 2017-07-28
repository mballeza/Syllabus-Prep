//
//  RandNum.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/17/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

// Class for random number generation. This may be removed or expanded
//  for random answer generation.

class RandNum {
	// Sets seed based on current time.
    func setRandSeed() {
        srandom(UInt32(time(nil)))
    }
    
	// Returns a uniformly distributed random number less than the mod value.
    func getRandNum(mod: Int) -> Int {
        return Int(arc4random_uniform(UInt32(mod)))
    }
}
