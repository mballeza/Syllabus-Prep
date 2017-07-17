//
//  ET_Scales.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

class ET_Scales {
    var scales : [(String, [Int8])]
    
    init() {
        scales = []
    }
    
    init(set:  [(String, [Int8])]) {
        scales = set
    }
}
