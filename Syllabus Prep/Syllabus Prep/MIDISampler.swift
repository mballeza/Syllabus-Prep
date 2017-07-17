//
//  MIDISampler.swift
//  AVFoundationMIDIPlay
//
//  Created by Gene De Lisa on 1/12/16.
//  Copyright © 2016 Gene De Lisa. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation

class MIDISampler {
    
    var engine:AVAudioEngine!
    var sampler:AVAudioUnitSampler!
    
    let melodicBank = UInt8(kAUSampler_DefaultMelodicBankMSB)
    let defaultBankLSB = UInt8(kAUSampler_DefaultBankLSB)
    
    let gmBrightAcousticPiano = UInt8(2)
    let millisecond = 1000000
    
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
    
    func playMajorScale() {
        // of course, loading the patch every time is not optimal.
        loadPatch(gmBrightAcousticPiano)
        let majorscale = [65, 67, 69, 70, 72, 74, 76, 77]
        for i in majorscale {
            self.sampler.startNote(UInt8(i), withVelocity: 64, onChannel: 0)
            usleep(UInt32(0.5 * Double(millisecond)))
            self.sampler.stopNote(UInt8(i), onChannel: 0)
        }
    }
}

