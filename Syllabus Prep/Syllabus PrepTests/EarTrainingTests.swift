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
    let intervalname = ETT_NAMES.interval
    let chordname = ETT_NAMES.chord
    let scalename = ETT_NAMES.scale
    let major2nd = setIntervals.majorsecond
    let minor2nd = setIntervals.minorsecond
    let majortriad = setChords.majortriad
    let minortriad = setChords.minortriad
    let majorscale = setScales.major
    let dorian = setScales.dorian
    var intervalset:[setTuple]!
    var chordset:[setTuple]!
    var scaleset:[setTuple]!
    
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
    
    func testAll() {
        self.testEarTrainingNewObjects()
        self.testEarTrainingLevel()
        self.testGetEarTrainingPlaySetAllLevels()
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
        
        let randInterval:setTuple = intervals.getInterval()
        let randChord:setTuple = chords.getSet()
        let randScale:setTuple = scales.getSet()
        
        // Assert getInterval() and getSet() is contained within the initial set
        XCTAssert(intervalset[0].value == randInterval.value || intervalset[1].value == randInterval.value, "Interval set does not match init")
        XCTAssert(chordset[0].value == randChord.valueset || chordset[1].valueset == randChord.valueset, "Chord set does not match init")
        XCTAssert(scaleset[0].value == randScale.valueset || scaleset[1].valueset == randScale.valueset, "Scale set does not match init")
    }
    
    /*  playSet() was removed
    // Test for MIDISampler.playSet(). Tests for valid and invalid EAR_TRAINING_TYPE_VALUES.
    func testMIDIPlaySet() {
        intervals = ET_Intervals(set: intervalset)
        chords = ET_Chords(set: chordset)
        scales = ET_Scales(set: scaleset)
        let sampler = MIDISampler()
        
        // Valid value
        XCTAssertNoThrow(try sampler.playSet(randSetNum: 0, playSet: intervals), "Sampler play set throws error")
        
        // Invalid value
        XCTAssertThrowsError(try sampler.playSet(randSetNum: -1, playSet: intervals))
    }
    */
    
    func testEarTrainingLevel() {
        let testET = SyllabusLevels()
        
        XCTAssert(!testET.assertLevel(level: 0) && !testET.assertLevel(level: 11), "assertLevel returned true when false expected")
        for i in 1...10 {
            XCTAssert(testET.assertLevel(level: i), "assertLevel returned false when true expected")
        }
    }
    
    // Tests all valid and invalid type set values when passed to the
    //  EarTraining class function getEarTrainingPlaySet().
    func testGetEarTrainingPlaySetAllLevels() {
        let numLevels = 10
        var testET: [EarTraining] = Array(repeating: EarTraining(level: 0), count: numLevels)
        var validChoice: [[Int]] = Array(repeating: [], count: numLevels)
        var invalidChoice: [[Int]] = Array(repeating: [], count: numLevels)
        
        for i in 0...9 {
            testET[i] = EarTraining(level: i+1)
        }
        
        // Syllabus levels 1 to 10
        validChoice[0] = [1]    // Chords only
        validChoice[1] = [0,1]  // Intervals and chords
        validChoice[2] = [0,2]
        validChoice[3] = [0,2]
        validChoice[4] = [0,2]
        validChoice[5] = [0,2]
        validChoice[6] = [1]    // Chords only
        validChoice[7] = [0]    // Intervals only
        validChoice[8] = [0]
        validChoice[9] = [0]
        
        invalidChoice[0] = [-1, 0, 2, 100]
        invalidChoice[1] = [-1, 2, 100]
        invalidChoice[2] = [-1, 1, 100]
        invalidChoice[3] = [-1, 1, 100]
        invalidChoice[4] = [-1, 1, 100]
        invalidChoice[5] = [-1, 1, 100]
        invalidChoice[6] = [-1, 0, 2, 100]
        invalidChoice[7] = [-1, 1, 2, 100]
        invalidChoice[8] = [-1, 1, 2, 100]
        invalidChoice[9] = [-1, 1, 2, 100]
        
        for i in 0...9 {
            for choice in validChoice[i] {
                XCTAssert(!testET[i].getEarTrainingPlaySet(ETTValue: choice).isEmpty(), "Valid choice of " + String(choice) + " returned empty type.")
            }
            
            
            for choice in invalidChoice[i] {
                XCTAssert(testET[i].getEarTrainingPlaySet(ETTValue: choice).isEmpty(), "Invalid choice of " + String(choice) + " returned nonempty type.")
            }
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
