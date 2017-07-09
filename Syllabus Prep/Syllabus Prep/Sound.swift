//
//  Sound.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/9/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//

import Foundation
import AVFoundation

class Sound: NSObject {
    var avPlayer: AVAudioPlayer!
    
    
    func readFileIntoAVPlayer() {
        guard let fileURL = Bundle.main.path(forResource: "test", ofType: "mp3") else {
            print("could not read sound file")
            return
        }
        
        let url = URL(fileURLWithPath: fileURL)
        
        do {
            try self.avPlayer = AVAudioPlayer(contentsOf: url)
        } catch {
            print("could not create AVAudioPlayer \(error)")
            return
        }
        
        print("playing \(fileURL)")
        avPlayer.delegate = self
        avPlayer.prepareToPlay()
        avPlayer.volume = 1.0
        avPlayer.play()
    }
    
    func stopAVPlayer() {
        if avPlayer.isPlaying {
            avPlayer.stop()
        }
    }
    
    func toggleAVPlayer() {
        if avPlayer.isPlaying {
            avPlayer.pause()
        } else {
            avPlayer.play()
        }
    }
}

extension Sound : AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("finishedplaying \(flag)")
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        if let e = error {
            print("\(e.localizedDescription)")
        }
    }
}
