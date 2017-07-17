//
//  ET_Chords.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

class ET_Chords : EAR_TRAINING_TYPE {
    var chords : [(String, [Int8])]?
    
    override init() {
        super.init()
        chords = []
    }
    
    init(set: [(String, [Int8])]) {
        super.init(name: "chord")
        chords = set
    }
    
    override func isEmpty() -> Bool {
        return chords!.count == 0
    }
    
    override func getSet() -> [Int8] {
        return self.chords![RandNum().getRandNum(mod: self.chords!.count)].1
    }
}
