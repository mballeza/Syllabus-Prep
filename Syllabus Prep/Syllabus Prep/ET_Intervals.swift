//
//  ET_Intervals.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

class ET_Intervals : EAR_TRAINING_TYPE {
    var intervalSet : [(String, Int8)]?
    
    override init() {
        super.init()
        self.intervalSet = []
    }
    
    init(set: [(String, Int8)]) {
        super.init(name: "interval")
        self.intervalSet = set
    }
    
    override func isEmpty() -> Bool {
        return intervalSet!.count == 0
    }
    
    override func getInterval() -> Int8 {
        return self.intervalSet![RandNum().getRandNum(mod: self.intervalSet!.count)].1
    }
}
