//
//  Names.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 8/3/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation

struct IntervalNames {
    let minorsecond = "Minor 2nd"
    let majorsecond = "Major 2nd"
    let minorthird = "Minor 3rd"
    let majorthird = "Major 3rd"
    let perfectfourth = "Perfect 4th"
    let augmentedfourth = "Augmented 4th"
    let tritone = "Tritone"
    let diminishedfifth = "Diminished 5th"
    let perfectfifth = "Perfect 5th"
    let augmentedfifth = "Augmented 5th"
    let minorsixth = "Minor 6th"
    let majorsixth = "Major 6th"
    let minorseventh = "Minor 7th"
    let majorseventh = "Major 7th"
    let octave = "Octave"
    let all:[String]!
    
    init () {
        all = [minorsecond, majorsecond, minorthird, majorthird, perfectfourth, augmentedfourth, diminishedfifth, perfectfifth, augmentedfifth, minorsixth, majorsixth, minorseventh, majorseventh, octave]
    }
}

struct ChordNames {
    let minortriad = "Minor Triad"
    let majortriad = "Major Triad"
    let diminishedtriad = "Diminished Triad"
    let augmentedtriad = "Augmented Triad"
    let all:[String]!
    
    init() {
        all = [minortriad, majortriad, diminishedtriad, augmentedtriad]
    }
}

struct ScaleNames {
    let major = "Major"
    let naturalminor = "Natural Minor"
    let harmonicminor = "Harmonic Minor"
    let melodicminor = "Melodic Minor"
    let wholetone = "Wholetone"
    let chromatic = "Chromatic"
    let dorian = "Dorian"
    let phrygian = "Phrygian"
    let lydian = "Lydian"
    let mixolydian = "Mixolydian"
    let locrian = "Locrian"
    let all:[String]!
    
    init() {
        all = [major, naturalminor, harmonicminor, melodicminor, chromatic, wholetone, dorian, phrygian, lydian, mixolydian, locrian]
    }
}

struct IntervalFakeNames {
    let semiperfectfourth = "Semi-Perfect 4th"
    let semiperfectfifth = "Semi-Perfect 5th"
    let wholetone = "Wholetone"
    let halfoctave = "Half Octave"
    let minoroctave = "Minor Octave"
    let halfjump = "Halfjump"
    let all:[String]!
    
    init() {
        all = [halfjump, halfoctave, minoroctave, semiperfectfifth, semiperfectfourth, wholetone]
    }
}

struct ChordFakeNames {
    let perfecttriad = "Perfect Triad"
    let harmonictriad = "Harmonic Triad"
    let melodictriad = "Melodic Triad"
    let halfharmonictriad = "Half-Harmonic Triad"
    let all:[String]!
    
    init() {
        all = [halfharmonictriad, harmonictriad, melodictriad, perfecttriad]
    }
}

struct ScaleFakeNames {
    let magician = "Magician"
    let lorian = "Lorian"
    let african = "African"
    let tenor = "Tenor"
    let all:[String]!
    
    init() {
        all = [african, lorian, magician, tenor]
    }
}

let INTERVAL_NAMES = IntervalNames()
let CHORD_NAMES = ChordNames()
let SCALE_NAMES = ScaleNames()

let INTERVAL_FAKE_NAMES = IntervalFakeNames()
let CHORD_FAKE_NAMES = ChordFakeNames()
let SCALE_FAKE_NAMES = ScaleFakeNames()
