//
//  ET_Chords.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

class ET_Chords {
    var chords : [(String, [Int8])]
    
    init() {
        chords = []
    }
    
    init(set: [(String, [Int8])]) {
        chords = set
    }
}
