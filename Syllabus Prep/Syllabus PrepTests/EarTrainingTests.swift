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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEarTrainingNewObjects() {
        let intervalname = "interval"
        let chordname = "chord"
        let scalename = "scale"
        let intervalset = Int8(1)
        let chordset : [Int8] = [1,2]
        let scaleset : [Int8] = [1,2,-2,-1]
        intervals = ET_Intervals()
        chords = ET_Chords()
        scales = ET_Scales()
        
        XCTAssert(intervals.isEmpty(), "Intervals returned nonempty when empty")
        XCTAssert(chords.isEmpty(), "Chords returned nonempty when empty")
        XCTAssert(scales.isEmpty(), "Scales returned nonempty when empty")

        intervals = ET_Intervals(set: [(intervalname, intervalset)])
        chords = ET_Chords(set: [(chordname, chordset)])
        scales = ET_Scales(set: [(scalename, scaleset)])
        
        XCTAssert(!intervals.isEmpty(), "Intervals returned empty when nonempty")
        XCTAssert(!chords.isEmpty(), "Chords returned empty when nonempty")
        XCTAssert(!scales.isEmpty(), "Scales returned empty when nonempty")
        
        XCTAssert(intervals.name == intervalname, "Interval name does not match init")
        XCTAssert(chords.name == chordname, "Chord name does not match init")
        XCTAssert(scales.name == scalename, "Interval name does not match init")

        XCTAssert(intervals.getInterval() == intervalset, "Interval set does not match init")
        XCTAssert(chords.getSet() == chordset, "Chord set does not match init")
        XCTAssert(scales.getSet() == scaleset, "Scale set does not match init")
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
