//
//  Notes.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

struct Notes {
    var AFlat, A, BFlat, B, C, DFlat, D, EFlat, E, F, GFlat, G : [Int8]!
    
    init() {
        //self.AFlat = [8, 20, 32, 44, 56, 68, 80, 92, 104, 116]
        self.AFlat = [44, 56, 68]
        self.A = increment(note: AFlat)
        self.BFlat = increment(note: A)
        self.B = increment(note: BFlat)
        self.C = increment(note: B)
        self.DFlat = increment(note: C)
        self.D = increment(note: DFlat)
        self.EFlat = increment(note: D)
        self.E = increment(note: EFlat)
        self.F = increment(note: E)
        self.GFlat = increment(note : F)
        self.G = increment(note: GFlat)
    }
    
    fileprivate func increment(note: [Int8]) -> [Int8] {
        var nextNote : [Int8] = Array(repeating: 0, count: note.count)
        for i in 0...note.count-1 {
            nextNote[Int(i)] = note[Int(i)] + 1
        }
        return nextNote
    }
}

let NOTES_ARRAY = [Notes().AFlat, Notes().A, Notes().BFlat, Notes().B, Notes().C, Notes().DFlat, Notes().D, Notes().EFlat, Notes().E, Notes().F, Notes().GFlat, Notes().G]
let NOTES_ARRAY_SIZE = NOTES_ARRAY.count
let NOTES_SIZE = Notes().AFlat.count


