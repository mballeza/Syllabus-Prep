struct EAR_TRAINING_TYPE_NAMES {
	let interval = "interval"
	let chord = "chord"
	let scale = "scale"
}

struct EAR_TRAINING_TYPE_VALUES{
	let interval = 0
	let chord = 1
	let scale = 2
}

struct INTERVAL_MODES {
	let major = "major"
	let minor = "minor"
	let augmented = "augmented"
	let diminished = "diminished"
	let perfect = "perfect"
	let tritone = "tritone"
	let octave = "octave"
}

struct INTERVAL_TYPES {
	let second = "second"
	let third = "third"
	let fourth = "fourth"
	let fifth = "fifth"
	let sixth = "sixth"
	let seventh = "seventh"
}

struct CHORD_MODES {
	let major = "major"
	let minor = "minor"
	let augmented = "augmented"
	let diminished = "diminished"
}

struct CHORD_TYPES {
	let triad = "triad"
}

struct SCALES_AND_MODES {
	let naturalminor = "naturalminor"
	let harmonicminor = "harmonicminor"
	let melodicminor = "melodicminor"
	let wholetone = "wholetone"
	let chromatic = "chromatic"

	let dorian = "dorian"
	let phrygian = "phrygian"
	let lydian = "lydian"
	let mixolydian = "mixolydian"
	let locrian = "locrian"
}

let intv_modes = INTERVAL_MODES()
let intv_types = INTERVAL_TYPES()
let chord_modes = CHORD_MODES()
let chord_types = CHORD_TYPES()
let scales_modes = SCALES_AND_MODES()

// This stores all 10 levels of the ear training portion of the syllabus. The information for each
//   level requirement was taken from the OMTA Piano Syllabus Levels I-X 2012 Version B book.
struct EAR_TRAINING_LEVEL_SETS {
	let ONE = EAR_TRAINING_SETS(
		intervalmode: 	[], 
		interval: 		[], 
		chordmode: 		[chord_modes.major, chord_modes.minor], 
		chord: 			[chord_types.triad], 
		scalemode: 		[] 
	)

	let TWO = EAR_TRAINING_SETS(
		intervalmode: 	[intv_modes.major, intv_modes.minor], 
		interval: 		[intv_types.third], 
		chordmode: 		[chord_modes.major, chord_modes.minor], 
		chord: 			[chord_types.triad], 
		scalemode: 		[] 
	)

	let THREE = EAR_TRAINING_SETS(
		intervalmode: 	[intv_modes.major, intv_modes.minor], 
		interval: 		[intv_types.second], 
		chordmode: 		[], 
		chord: 			[], 
		scalemode: 		[scales_modes.naturalminor, scales_modes.harmonicminor, scales_modes.melodicminor, scales_modes.wholetone, scales_modes.chromatic] 
	)

	let FOUR = EAR_TRAINING_SETS(
		intervalmode: 	[intv_modes.perfect], 
		interval: 		[intv_types.fourth, intv_types.fifth], 
		chordmode: 		[], 
		chord: 			[], 
		scalemode: 		[scales_modes.lydian, scales_modes.mixolydian] 
	)

	let FIVE = EAR_TRAINING_SETS(
		intervalmode: 	[intv_modes.major, intv_modes.minor], 
		interval: 		[intv_types.sixth], 
		chordmode: 		[], 
		chord: 			[], 
		scalemode: 		[scales_modes.dorian, scales_modes.phrygian] 
	)

	let SIX = EAR_TRAINING_SETS(
		intervalmode: 	[intv_modes.major, intv_modes.minor, intv_modes.tritone], 	// Special case. Tri-tone is alone.
		interval: 		[intv_types.seventh], 
		chordmode: 		[], 
		chord: 			[], 
		scalemode: 		[scales_modes.locrian, scales_modes.wholetone, scales_modes.chromatic] 
	)

	let SEVEN = EAR_TRAINING_SETS(
		intervalmode: 	[], 
		interval: 		[], 
		chordmode: 		[chord_modes.major, chord_modes.minor, chord_modes.diminished, chord_modes.augmented], 
		chord: 			[chord_types.triad], 
		scalemode: 		[] 
	)

	let EIGHT = EAR_TRAINING_SETS(
		intervalmode: 	[intv_modes.major, intv_modes.minor, intv_modes.perfect, intv_modes.tritone], 
		interval: 		[intv_types.second, intv_types.third], 
		chordmode: 		[], 
		chord: 			[], 
		scalemode: 		[] 
	)

	let NINE = EAR_TRAINING_SETS(
		intervalmode: 	[intv_modes.major, intv_modes.minor, intv_modes.perfect, intv_modes.octave], 
		interval: 		[intv_types.fifth, intv_types.sixth, intv_types.seventh], 
		chordmode: 		[], 
		chord:		 	[], 
		scalemode: 		[] 
	)

	let TEN = EAR_TRAINING_SETS(
		intervalmode: 	[intv_modes.major, intv_modes.minor, intv_modes.augmented, intv_modes.diminished, intv_modes.perfect, intv_modes.tritone, intv_modes.octave], 
		interval: 		[intv_types.second, intv_types.third, intv_types.fourth, intv_types.fifth, intv_types.sixth, intv_types.seventh], 
		chordmode: 		[], 
		chord: 			[], 
		scalemode: 		[] 
	)
} 

// This stores String arrays of the modes and types in a particular ear training type (interval,
//   chord, or scale). The indexes of the two arrays are accessed at random by EarTraining for
//   a test question.
class EAR_TRAINING_TYPE {
	var mode : [String] // Ex: "major", "minor"
	var type : [String]	// Ex: "triad", "seventh"

	init() {
		self.mode = []
		self.type = []
	}

	init(mode: [String], type: [String]) {
		self.mode = mode
		self.type = type
	}

	// Returns true if mode is empty.
	func isEmpty() -> Bool {
		return mode.count == 0
	}

	// Returns true if type is a scale. This means mode is nonempty and type is empty.
	func isScale() -> Bool {
		return mode.count > 0 && type.count == 0
	}

	func isValidInterval(mode : String, type: String) -> Int{
		var rc = 1
		switch mode {
			case intv_modes.tritone, intv_modes.octave : 
				rc = -1 

			case intv_modes.augmented, intv_modes.diminished, intv_modes.perfect :
				if (type == intv_types.fourth || type == intv_types.fifth) {
					rc = 1
				} else {
					rc = 0
				}

			default: 
				if (type == intv_types.fourth || type == intv_types.fifth) {
					rc = 0
				} else {
					rc = 1
				}
		}

		return rc
	}
}

// This stores all three ear training types.
class EAR_TRAINING_SETS {
	let INTERVALS : EAR_TRAINING_TYPE
	let CHORDS : EAR_TRAINING_TYPE 
	let SCALES : EAR_TRAINING_TYPE

	init() {
		self.INTERVALS = EAR_TRAINING_TYPE()
		self.CHORDS = EAR_TRAINING_TYPE()
		self.SCALES = EAR_TRAINING_TYPE()
	}

	init(intervalmode : [String], interval : [String], chordmode : [String], chord : [String], scalemode : [String]) {
		self.INTERVALS = EAR_TRAINING_TYPE(mode: intervalmode, type: interval)
		self.CHORDS = EAR_TRAINING_TYPE(mode: chordmode, type: chord)
		self.SCALES = EAR_TRAINING_TYPE(mode: scalemode, type: [])
	}

	func displaySetChoices() {
		if !self.INTERVALS.isEmpty() {
			print(String(EAR_TRAINING_TYPE_VALUES().interval) + ": " + EAR_TRAINING_TYPE_NAMES().interval)
		}
		if !self.CHORDS.isEmpty() {
			print(String(EAR_TRAINING_TYPE_VALUES().chord) + ": " + EAR_TRAINING_TYPE_NAMES().chord)
		}
		if !self.SCALES.isEmpty() {
			print(String(EAR_TRAINING_TYPE_VALUES().scale) + ": " + EAR_TRAINING_TYPE_NAMES().scale)
		}
	}
}

