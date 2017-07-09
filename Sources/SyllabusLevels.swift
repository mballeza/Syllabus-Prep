import Foundation
import Glibc

class SyllabusLevels {
	var TypeLevel : [Types]

	init(level: Int) {
		switch level {
			case 1: TypeLevel = [MajorScale(), MinorScale()]
			case 2: TypeLevel = [MajorScale(), MinorScale(), HarmonicMinorScale(), MelodicMinorScale()]
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
		let NUM_FILE_ENTRY = 3
		let NUM_TYPES = TypeLevel.count

		srandom(UInt32(time(nil)))

		let randnum = random() % NUM_TYPES
		let randidx = random() % NUM_FILE_ENTRY

		let foo = TypeLevel[randnum]
		foo.readEntry(index: randidx)

		#if AUDIO
		print("Playing test mp3 file, please wait 16 seconds")
		sleep(1)
		let rc = foo.playAudio()
		if rc == 0 {
			print("Playback successful")
		} else {
			print("Playback unsuccessful")
		}
		#endif

		print("Enter the scale type")
		let response = readLine()
		if foo.isCorrectType(guess: response!.lowercased()) {
			print("Correct!")
		} else {
			print("Incorrect!")
		}
	}
}
