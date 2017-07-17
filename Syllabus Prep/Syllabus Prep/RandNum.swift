//
//  RandNum.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/17/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

class RandNum {
    func setRandSeed() {
        srandom(UInt32(time(nil)))
    }
    
    func getRandNum(mod: Int) -> Int {
        return Int(arc4random_uniform(UInt32(mod)))
    }
}
