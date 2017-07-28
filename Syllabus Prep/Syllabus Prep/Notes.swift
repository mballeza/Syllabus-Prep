//
//  Notes.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

// Notes structure. Contains all notes from A flat to G (only used flats
//  and not sharps to identify black keys). Each note contains an array
//  of Int8 values that represent the MIDI Note Numbers, where "middle C",
//  or C5 is equal to 60.

struct Notes {
    var AFlat, A, BFlat, B, C, DFlat, D, EFlat, E, F, GFlat, G : [Int8]!
    
    init() {
        //self.AFlat = [8, 20, 32, 44, 56, 68, 80, 92, 104, 116]
        self.AFlat = [44, 56, 68]	// Three octave range for now
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
    
	// Increments an array by 1 and returns the new array.
    fileprivate func increment(note: [Int8]) -> [Int8] {
        var nextNote : [Int8] = Array(repeating: 0, count: note.count)
        for i in 0...note.count-1 {
            nextNote[Int(i)] = note[Int(i)] + 1
        }
        return nextNote
    }
}

// Hack, puts all the notes into an array for easy random access
let NOTES_ARRAY = [Notes().AFlat, Notes().A, Notes().BFlat, Notes().B, Notes().C, Notes().DFlat, Notes().D, Notes().EFlat, Notes().E, Notes().F, Notes().GFlat, Notes().G]

let NOTES_ARRAY_SIZE = NOTES_ARRAY.count	// Number of Notes, i.e. 12 notes.
let NOTES_SIZE = Notes().AFlat.count		// Value of octave range.


