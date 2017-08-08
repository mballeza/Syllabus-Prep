//
//  MIDISampler.swift
//  AVFoundationMIDIPlay
//
//  Created by Gene De Lisa on 1/12/16.
//  Copyright © 2016 Gene De Lisa. All rights reserved.
//
//
//  Syllabus Prep
//
//  Modified by Matthew Balleza on 7/16/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//  This software is released under the "Apache 2.0 License".
//  Please see the file LICENSE in the source distribution of
//  this software for license terms.
//
//  This software was modified from the above person(s) under
//  the permissions of the "MIT License".
//  Please see the file LICENSE-DeLisa in the source distribution
//  of this software (Syllabus Prep) for license terms.

import Foundation
import AVKit
import AVFoundation

enum MIDIErrors : Error {
    case invalidETTValue
}

class MIDISampler {
    
    var engine:AVAudioEngine!
    var sampler:AVAudioUnitSampler!
    
    let melodicBank = UInt8(kAUSampler_DefaultMelodicBankMSB)
    let defaultBankLSB = UInt8(kAUSampler_DefaultBankLSB)
    
    let gmBrightAcousticPiano = UInt8(2)
    let ticksPerSecond = Double(1000000)
    let defaultVolume = UInt8(64)
    
    let noteset = Notes()
    
    init() {
        initAudioEngine()
    }
    
    func initAudioEngine () {
        
        engine = AVAudioEngine()

        sampler = AVAudioUnitSampler()
        engine.attach(sampler)
        
        engine.connect(sampler, to: engine.mainMixerNode, format: nil)
        
        startEngine()
    }
    
    func startEngine() {
        
        if engine.isRunning {
            print("audio engine already started")
            return
        }
        
        do {
            try engine.start()
            print("audio engine started")
        } catch {
            print("oops \(error)")
            print("could not start audio engine")
        }
    }
    
   
    func loadPatch(_ gmpatch:UInt8, channel:UInt8 = 0) {
        
        guard let soundbank =
            Bundle.main.url(forResource: "GeneralUser GS MuseScore v1.442", withExtension: "sf2")
            else {
                print("could not read sound font")
                return
        }
        
        do {
            try sampler.loadSoundBankInstrument(at: soundbank, program:gmpatch,
                bankMSB: melodicBank, bankLSB: defaultBankLSB)
            
        } catch let error as NSError {
            print("\(error.localizedDescription)")
            return
        }
        
        self.sampler.sendProgramChange(gmpatch, bankMSB: melodicBank, bankLSB: defaultBankLSB, onChannel: channel)
    }
    
    // Plays two MIDI notes. First it plays a random note, then plays a note with the distance
    //  of 'interval' half-steps above the first note. Then it plays both at the same time.
    func playInterval(interval: [Int8]) {
        loadPatch(gmBrightAcousticPiano)    // Necessary to load each time??
        
        let startKey = noteset.all[RandNum().getRandNum(mod: noteset.all.count)]
        let firstKey = startKey[RandNum().getRandNum(mod: noteset.notesize)]
        let secondKey = firstKey + interval[0]
        
        let playSet : [Int8] = [firstKey, secondKey]    // Contains literal MIDI note values
        
        playNoteSetTogether(set: playSet)
    }
    
    // Plays three MIDI notes. Similar to playInterval. Plays three notes separately and then
    //  together. The first note is random, second note is 'chord[0]' half-steps above the root,
    //  and the third note is 'chord[1]' half-steps above the root.
    func playChord(chord: [Int8]) {
        loadPatch(gmBrightAcousticPiano)    // Necessary to load each time??
        
        let startKey = noteset.all[RandNum().getRandNum(mod: noteset.all.count)]
        let firstKey = startKey[RandNum().getRandNum(mod: noteset.notesize)]
        let secondKey = firstKey + chord[0]
        let thirdKey = firstKey + chord[1]
        
        let playSet : [Int8] = [firstKey, secondKey, thirdKey]  // Contains literal MIDI note values
        
        playNoteSetTogether(set: playSet)
    }
    
    // Plays MIDI notes separate, then together. The set array contains literal MIDI note values
    //  rather than relative half-step differences.
    func playNoteSetTogether(set: [Int8]) {
        // Play notes separate
        for i in 0...set.count-1 {
            self.sampler.startNote(UInt8(set[i]), withVelocity: defaultVolume, onChannel: 0)
            pauseNoteDuration(seconds: 1)
        }
        
        for i in 0...set.count-1 {
            self.sampler.stopNote(UInt8(set[i]), onChannel: 0)
        }
        
        pauseNoteDuration(seconds: 0.5)
        
        // Then together
        for i in 0...set.count-1 {
            self.sampler.startNote(UInt8(set[i]), withVelocity: defaultVolume, onChannel: 0)
        }
        
        pauseNoteDuration(seconds: 2)
        
        for i in 0...set.count-1 {
            self.sampler.stopNote(UInt8(set[i]), onChannel: 0)
        }
    }
    
    // Plays a scale/mode. Plays all notes separately.
    func playScale(scale: [Int8]) {
        loadPatch(gmBrightAcousticPiano)    // Necessary to load each time??

        // Will contain MIDI literal note values. The count is 1 higher than the given scale array.
        //  This is because the scale array contains half-step differences between each previous note.
        //  The starting note will be index 0, and the rest will be computed and entered into the 
        //  rest of the array.
        var playSet : [Int8] = Array(repeating: 0, count: scale.count + 1)
        
        let startKey = noteset.all[RandNum().getRandNum(mod: noteset.all.count)]
        let firstKey = startKey[RandNum().getRandNum(mod: noteset.notesize)]
        
        playSet[0] = firstKey
        
        for i in 1...scale.count {
            playSet[i] = scale[i-1] + playSet[i-1]
        }
        
        for i in 0...scale.count {
            self.sampler.startNote(UInt8(playSet[i]), withVelocity: defaultVolume, onChannel: 0)
            pauseNoteDuration(seconds: 0.5)
            self.sampler.stopNote(UInt8(playSet[i]), onChannel: 0)
        }

    }

    // Non-optimal way of creating space between notes. There should be better MIDI tools that can
    //  accomplish this, but none that I could find that could also load a MIDI patch (to play notes
    //  with a piano sound).
    func pauseNoteDuration(seconds: Double) {
        usleep(UInt32(seconds * ticksPerSecond))
    }
}

