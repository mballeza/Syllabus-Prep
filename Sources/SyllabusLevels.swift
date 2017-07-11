import Foundation
#if os(Linux)
import Glibc
#else
import Darwin
#endif

struct INTERVAL_LEVEL_SETS {
	let ONE = [["major", "minor"], ["interval"]]
	let TWO = [["major", "minor"], ["interval", "triad"]] 
	let THREE = [["major", "minor", "diminished"], ["interval", "triad"]]
	let FOUR = [["major", "minor", "diminished"], ["interval", "triad", "seventh"]]
} 

let INTERVAL_LEVELS = INTERVAL_LEVEL_SETS()
let NUM_FILE_ENTRY = 3

class SyllabusLevels {
	var TypeLevel : Types
	var playSet : [[String]]
	let MAX_LEVEL = 10
	let MIN_LEVEL = 1

	init() { 
		playSet = []
		TypeLevel = Types()
	}
	init(level: Int) {
		playSet = []
		TypeLevel = Types()
	}

	func assertLevel(level: Int) -> Bool {
		let isValid = level >= MIN_LEVEL && level <= MAX_LEVEL

		if !isValid {
			print("Invalid level")
		}
		return isValid
	}

	func giveTestQuestion() {
/*
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

		queryType()
*/
	}

	func queryType() {
		print("DEFAULT: should not display")
	}

	func setRandSeed() {
		srandom(UInt32(time(nil)))
	}

	func getRandIndex(mod: Int) -> Int {
#if os(Linux)
		return random() % mod
#else
		return Int(arc4random()) % mod
#endif
	}
}

class EarTraining: SyllabusLevels {
	var stringType : String?

	override init(level: Int) {
		super.init()
		switch level {
			case 1: playSet = INTERVAL_LEVELS.ONE
				break

			case 2: playSet = INTERVAL_LEVELS.TWO
				break

			case 3: playSet = INTERVAL_LEVELS.THREE
				break

			case 4: playSet = INTERVAL_LEVELS.FOUR
				break

			default: playSet = []
				break
		}
		createType()
	}

	func createType() {
		let firstCount = playSet[0].count
		let secondCount = playSet[1].count

		setRandSeed()

		var randnum0 = getRandIndex(mod: firstCount)
		var randnum1 = getRandIndex(mod: secondCount)

		while playSet[0][randnum0] == "diminished" && playSet[1][randnum1] == "interval" {
			randnum0 = getRandIndex(mod: firstCount)
			randnum1 = getRandIndex(mod: secondCount)
		}

		TypeLevel = Types(firstname: playSet[0][randnum0], secondname: playSet[1][randnum1])
		stringType = playSet[1][randnum1]
	}

	override func giveTestQuestion() {
		TypeLevel.readEntry(index: getRandIndex(mod: NUM_FILE_ENTRY))
		queryType()
	}

	override func queryType() {
		print("Enter the " + stringType! + " type")
		let response = readLine()
		if TypeLevel.isCorrectType(guess: response!.lowercased()) {
			print("Correct!")
		} else {
			print("Incorrect!")
		}
	}
}
