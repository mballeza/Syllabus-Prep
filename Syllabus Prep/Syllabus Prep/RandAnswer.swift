//
//  RandAnswer.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 8/3/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//  This software is released under the "Apache 2.0 License".
//  Please see the file LICENSE in the source distribution of
//  this software for license terms.

import Foundation

class RandAnswer: RandNum {
    func getRandAnswerSameType(type: String) -> String {
        var answerToReturn:String!
        
        switch type {
        case ETT_NAMES.interval:
            answerToReturn = INTERVAL_NAMES.all[getRandNum(mod: INTERVAL_NAMES.all.count)]
        case ETT_NAMES.chord:
            answerToReturn = CHORD_NAMES.all[getRandNum(mod: CHORD_NAMES.all.count)]
        case ETT_NAMES.scale:
            answerToReturn = SCALE_NAMES.all[getRandNum(mod: SCALE_NAMES.all.count)]
        default:
            answerToReturn = "Default"
        }
        
        return answerToReturn
    }
    
    func getRandAnswerFakeType(type: String) -> String {
        var answerToReturn:String!
        
        switch type {
        case ETT_NAMES.interval:
            answerToReturn = INTERVAL_FAKE_NAMES.all[getRandNum(mod: INTERVAL_FAKE_NAMES.all.count)]
        case ETT_NAMES.chord:
            answerToReturn = CHORD_FAKE_NAMES.all[getRandNum(mod: CHORD_FAKE_NAMES.all.count)]
        case ETT_NAMES.scale:
            answerToReturn = SCALE_FAKE_NAMES.all[getRandNum(mod: SCALE_FAKE_NAMES.all.count)]
        default:
            answerToReturn = "Default"
        }
        
        return answerToReturn
    }
    
    // Gets a random index between 0 and 3, the new array starts on that value of the old array.
    //  Ex: answers = ["1st", "2nd", "3rd", "4th"]
    //      suppose that: 
    //          oldIndexInitial = 2
    //        then
    //          newArray = ["3rd", "4th", "1st", "2nd"]
    func rotateAnswers(answers: [String]) -> [String] {
        var newArray:[String] = Array(repeating: "", count: answers.count)
        let oldIndexInitial = getRandNum(mod: answers.count)
        
        for i in 0...answers.count-1 {
            newArray[i] = answers[(oldIndexInitial + i) % answers.count]
        }
        
        return newArray
    }
}
