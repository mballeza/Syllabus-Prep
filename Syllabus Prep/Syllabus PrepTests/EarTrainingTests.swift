//
//  EarTrainingTests.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/29/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import XCTest
@testable import Syllabus_Prep

class EarTrainingTests: XCTestCase {
    var intervals:ET_Intervals!
    var chords:ET_Chords!
    var scales:ET_Scales!
    let intervalname = "interval"
    let chordname = "chord"
    let scalename = "scale"
    let major2nd = setIntervals.majorsecond
    let minor2nd = setIntervals.minorsecond
    let majortriad = setChords.majortriad
    let minortriad = setChords.minortriad
    let majorscale = setScales.major
    let dorian = setScales.dorian
    var intervalset:[(String, Int8)]!
    var chordset:[(String, [Int8])]!
    var scaleset:[(String, [Int8])]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        intervalset = [major2nd, minor2nd]
        chordset = [majortriad, minortriad]
        scaleset = [majorscale, dorian]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        intervals = nil
        chords = nil
        scales = nil
    }
    
    // Test for Ear Training Types object creation. Tests for empty and nonempty objects.
    func testEarTrainingNewObjects() {

        intervals = ET_Intervals()
        chords = ET_Chords()
        scales = ET_Scales()
        
        // Empty case
        XCTAssert(intervals.isEmpty(), "Intervals returned nonempty when empty")
        XCTAssert(chords.isEmpty(), "Chords returned nonempty when empty")
        XCTAssert(scales.isEmpty(), "Scales returned nonempty when empty")

        intervals = ET_Intervals(set: intervalset)
        chords = ET_Chords(set: chordset)
        scales = ET_Scales(set: scaleset)
        
        // Nonempty case
        XCTAssert(!intervals.isEmpty(), "Intervals returned empty when nonempty")
        XCTAssert(!chords.isEmpty(), "Chords returned empty when nonempty")
        XCTAssert(!scales.isEmpty(), "Scales returned empty when nonempty")
        
        // Assert name match
        XCTAssert(intervals.name == intervalname, "Interval name does not match init")
        XCTAssert(chords.name == chordname, "Chord name does not match init")
        XCTAssert(scales.name == scalename, "Interval name does not match init")
        
        let randInterval = intervals.getInterval()
        let randChord = chords.getSet()
        let randScale = scales.getSet()
        
        // Assert getInterval() and getSet() is contained within the initial set
        XCTAssert(intervalset[0].1 == randInterval || intervalset[1].1 == randInterval, "Interval set does not match init")
        XCTAssert(chordset[0].1 == randChord || chordset[1].1 == randChord, "Chord set does not match init")
        XCTAssert(scaleset[0].1 == randScale || scaleset[1].1 == randScale, "Scale set does not match init")
    }
    
    // Test for MIDISampler.playSet(). Tests for valid and invalid EAR_TRAINING_TYPE_VALUES.
    func testMIDIPlaySet() {
        intervals = ET_Intervals(set: intervalset)
        let sampler = MIDISampler()
        
        // Valid value
        XCTAssertNoThrow(try sampler.playSet(randSetNum: 0, playSet: intervals), "Sampler play set throws error")
        
        // Invalid value
        XCTAssertThrowsError(try sampler.playSet(randSetNum: -1, playSet: intervals))
    }
    
    func testEarTrainingLevel() {
        let testET = SyllabusLevels()
        
        XCTAssert(!testET.assertLevel(level: 0) && !testET.assertLevel(level: 11), "assertLevel returned true when false expected")
        for i in 1...10 {
            XCTAssert(testET.assertLevel(level: i), "assertLevel returned false when true expected")
        }
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
