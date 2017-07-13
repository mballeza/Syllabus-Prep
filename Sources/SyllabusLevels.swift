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
			case 2: playSet = EAR_TRAINING_LEVELS.TWO
			case 3: playSet = EAR_TRAINING_LEVELS.THREE
			case 4: playSet = EAR_TRAINING_LEVELS.FOUR
			case 5: playSet = EAR_TRAINING_LEVELS.FIVE
			case 6: playSet = EAR_TRAINING_LEVELS.SIX
			case 7: playSet = EAR_TRAINING_LEVELS.SEVEN
			case 8: playSet = EAR_TRAINING_LEVELS.EIGHT
			case 9: playSet = EAR_TRAINING_LEVELS.NINE
			case 10: playSet = EAR_TRAINING_LEVELS.TEN

			default: playSet = EAR_TRAINING_SETS()
		}

		setRandSeed()
	}

	// Generates random indexes to access the Type set. Returns a Types object.
	func createType(set: EAR_TRAINING_TYPE, setType: String) -> Types {
		let firstCount = set.mode.count
		let secondCount = set.type.count
		var firstname : String
		var secondname : String
		var isValid = 1

		repeat {
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

			// Hack. Checks if interval.
			if setType == "interval" {
				isValid = set.isValidInterval(mode: firstname, type: secondname)

				// If interval and is tritone or octave type.
				if isValid == -1 {
					secondname = ""
				}
			}
		} while (setType == "interval" && isValid == 0)

		return Types(firstname: firstname, secondname: secondname) 
	}

	// Retrieves a randomly generated Types class.
	override func giveTestQuestion() {
		var randSetNum : Int

		repeat {
			randSetNum = getRandIndex(mod : NUM_EAR_TRAINING_SETS)

			switch randSetNum {
				case 0: 
						stringType = "interval"
						TypeLevel = createType(set: playSet.INTERVALS, setType: stringType!)
				case 1: 
						stringType = "chord"
						TypeLevel = createType(set: playSet.CHORDS, setType: stringType!)
				case 2: 
						stringType = "scale"
						TypeLevel = createType(set: playSet.SCALES, setType: stringType!)
				default: 
						TypeLevel = Types()
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
