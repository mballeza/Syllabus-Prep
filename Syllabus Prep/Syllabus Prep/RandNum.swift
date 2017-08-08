//
//  RandNum.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/17/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//  This software is released under the "Apache 2.0 License".
//  Please see the file LICENSE in the source distribution of
//  this software for license terms.

import Foundation

// Class for random number generation. This has been expanded as of 8/3/17
//  for random answer generation. Seen RandAnswer.swift.

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
