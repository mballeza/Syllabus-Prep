import Foundation
#if os(Linux)
import Glibc
#else
import Darwin
#endif

let NUM_FILE_ENTRY = 3
let NUM_KEYS = 1

class SyllabusLevels {
	var TypeLevel : [[Types]]
	var playSet : [[String]]

	init() { 
		TypeLevel = [] 
		playSet = []
	}
	init(level: Int) {
		playSet = []
		switch level {
			case 1: TypeLevel = [[MajorScale(), MinorScale()], [KeyOfA()]]
			case 2: TypeLevel = [[MajorScale(), MinorScale(), HarmonicMinorScale(), MelodicMinorScale()], [KeyOfA()]]
			default: TypeLevel = []
		}
	}

	func assertLevel() -> Bool {
		let isValid = TypeLevel.count > 0

		if !isValid {
			print("Invalid level")
		}
		return isValid
	}

	func giveTestQuestion() {
		let numTypes = TypeLevel.count

		srandom(UInt32(time(nil)))

#if os(Linux)
		let randnum = random() % numTypes 
		let randidx = random() % NUM_FILE_ENTRY
#else
		let randnum = Int(arc4random()) % numTypes 
		let randidx = Int(arc4random()) % NUM_FILE_ENTRY
#endif

		let CurrentLevel = TypeLevel[0]
		let CurrentKey = TypeLevel[1]
		CurrentLevel[randnum].readEntry(index: randidx)

		#if AUDIO
		print("Playing test mp3 file, please wait 16 seconds")
		sleep(1)
		let rc = CurrentLevel.playAudio()
		if rc == 0 {
			print("Playback successful")
		} else {
			print("Playback unsuccessful")
		}
		#endif

		print("Enter the scale type")
		let response = readLine()
		if CurrentLevel[randnum].isCorrectType(guess: response!.lowercased()) {
			print("Correct!")
		} else {
			print("Incorrect!")
		}
	}
}

class EarTraining: SyllabusLevels {
	override init(level: Int) {
		super.init()
		switch level {
			case 1:
				break

			case 2: playSet = [["major", "minor"], ["third", "triad"]]
				break

			default: playSet = []
				break
		}
	}

	override func assertLevel() -> Bool {
		return playSet.count > 0
	}

	func createType() {
		var filename : String
		let firstCount = 2
		let secondCount = 2

		srandom(UInt32(time(nil)))

#if os(Linux)
		let randnum0 = random() % firstCount
		let randnum1 = random() % secondCount
#else
		let randnum0 = Int(arc4random()) % firstCount
		let randnum1 = Int(arc4random()) % secondCount 
#endif

		filename = playSet[0][randnum0] + playSet[1][randnum1]
	}
}
