//
//  ET_Chords.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

// Ear Training Chords. This class contains a set of Chords. Currently
//  there are two functions: isEmpty() and getSet(). The former returns
//  true if the Chord set is empty, and the latter returns an array from
//  a random chord tuple.

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
    
	// Returns true if class was not initialized with a nonempty chord set.
	// Returns false otherwise.
    override func isEmpty() -> Bool {
        return chords!.count == 0
    }
    
	// Returns a random array from a Chord tuple.
    override func getSet() -> [Int8] {
        return self.chords![RandNum().getRandNum(mod: self.chords!.count)].1
    }
}
