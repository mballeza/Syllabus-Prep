//
//  ET_Scales.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

class ET_Scales : EAR_TRAINING_TYPE {
    var scales : [(String, [Int8])]?
    
    override init() {
        super.init()
        scales = []
    }
    
    init(set:  [(String, [Int8])]) {
        super.init(name: "scale")
        scales = set
    }
    
    override func isEmpty() -> Bool {
        return scales!.count == 0
    }
    
    override func getSet() -> [Int8] {
        return self.scales![RandNum().getRandNum(mod: self.scales!.count)].1
    }
}
