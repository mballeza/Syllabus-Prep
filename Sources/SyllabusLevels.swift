import Foundation
import Glibc

let NUM_FILE_ENTRY = 3
let NUM_KEYS = 1

class SyllabusLevels {
	var TypeLevel : [[Types]]

	init(level: Int) {
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

		let randnum = random() % numTypes 
		let randidx = random() % NUM_FILE_ENTRY

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
