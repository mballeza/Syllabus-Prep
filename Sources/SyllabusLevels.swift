import Foundation
#if os(Linux)
import Glibc
#else
import Darwin
#endif

let EAR_TRAINING_LEVELS = EAR_TRAINING_LEVEL_SETS()
let NUM_EAR_TRAINING_SETS = 3 		// Only 3: intervals, chords, scales.
let NUM_FILE_ENTRY = 3				// Number of lines in a file. Only 3 for now for demo purposes.
let MAX_LEVEL = 10					// Max syllabus level
let MIN_LEVEL = 1					// Min syllabus level

class SyllabusLevels {
	var TypeLevel : Types			// The type for the current study session
	var playSet : EAR_TRAINING_SETS	// This is for ear training only, contains the requirement sets 
									//   for each level

	init() {
		TypeLevel = Types()
		playSet = EAR_TRAINING_SETS()
	}

	// Asserts the level is between 1 and 10
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
	var stringType : String?	// Hack, used in queryType. "interval", "chord", or "scale"

	init(level: Int) {
		super.init()

		// Syllabus levels
		switch level {
			case 1: playSet = EAR_TRAINING_LEVELS.ONE
				break

			case 2: playSet = EAR_TRAINING_LEVELS.TWO
				break

			case 3: playSet = EAR_TRAINING_LEVELS.THREE
				break

			case 4: playSet = EAR_TRAINING_LEVELS.FOUR
				break

			// TODO: case 5-10

			default: playSet = EAR_TRAINING_SETS()
				break
		}
	}

	// Generates random indexes to access the Type set. Returns a Types object.
	func createType(set: EAR_TRAINING_TYPE) -> Types {
		let firstCount = set.mode.count
		let secondCount = set.type.count
		let firstname : String
		let secondname : String

		// Hack. If empty mode or Types class.
		if firstCount == 0 {
			firstname = ""
		} else {
			firstname = set.mode[getRandIndex(mod: firstCount)]
		}

		// If empty type.
		if secondCount == 0 {
			secondname = ""
		} else {
			secondname = set.type[getRandIndex(mod: secondCount)]
		}

		return Types(firstname: firstname, secondname: secondname) 
	}

	// Retrieves a randomly generated Types class.
	override func giveTestQuestion() {
		var randSetNum : Int

		setRandSeed()

		repeat {
			randSetNum = getRandIndex(mod : NUM_EAR_TRAINING_SETS)

			switch randSetNum {
				case 0: TypeLevel = createType(set: playSet.INTERVALS)
						stringType = "interval"
						break
				case 1: TypeLevel = createType(set: playSet.CHORDS)
						stringType = "chord"
						break
				case 2: TypeLevel = createType(set: playSet.SCALES)
						stringType = "scale"
						break
				default: TypeLevel = Types()
						break
			}
		} while TypeLevel.isEmpty() 

		if TypeLevel.readEntry(index: getRandIndex(mod: NUM_FILE_ENTRY)) {
			queryType()
		}
	}

	// Asks the user to enter the mode of the interval/chord/scale given.
	override func queryType() {
		print("Enter the " + stringType! + " mode")
		let response = readLine()
		if TypeLevel.isCorrectType(guess: response!.lowercased()) {
			print("Correct!")
		} else {
			print("Incorrect!")
		}
	}
}
