// This stores String arrays of the modes and types in a particular ear training type (interval,
//   chord, or scale). The indexes of the two arrays are accessed at random by EarTraining for
//   a test question.
struct EAR_TRAINING_TYPE {
	var mode : [String] // Ex: "major", "minor"
	var type : [String]	// Ex: "triad", "seventh"

	init() {
		mode = []
		type = []
	}

	init(mode: [String], type: [String]) {
		self.mode = mode
		self.type = type
	}
}

// This stores all three ear training types.
struct EAR_TRAINING_SETS {
	let INTERVALS : EAR_TRAINING_TYPE
	let CHORDS : EAR_TRAINING_TYPE 
	let SCALES : EAR_TRAINING_TYPE

	init() {
		INTERVALS = EAR_TRAINING_TYPE()
		CHORDS = EAR_TRAINING_TYPE()
		SCALES = EAR_TRAINING_TYPE()
	}

	init(intervalmode : [String], interval : [String], chordmode : [String], chord : [String], scalemode : [String]) {
		INTERVALS = EAR_TRAINING_TYPE(mode: intervalmode, type: interval)
		CHORDS = EAR_TRAINING_TYPE(mode: chordmode, type: chord)
		SCALES = EAR_TRAINING_TYPE(mode: scalemode, type: [])
	}
}

// This stores all 10 levels of the ear training portion of the syllabus. The information for each
//   level requirement was taken from the OMTA Piano Syllabus Levels I-X 2012 Version B book.
struct EAR_TRAINING_LEVEL_SETS {
	let ONE = EAR_TRAINING_SETS(
									intervalmode: [], 
									interval: [], 
									chordmode: ["major", "minor"], 
									chord: ["triad"], 
									scalemode: [] 
								)

	let TWO = EAR_TRAINING_SETS(
									intervalmode: ["major", "minor"], 
									interval: ["third"], 
									chordmode: ["major", "minor"], 
									chord: ["triad"], 
									scalemode: [] 
								)

	let THREE = EAR_TRAINING_SETS(
									intervalmode: ["major", "minor"], 
									interval: ["second"], 
									chordmode: [], 
									chord: [], 
									scalemode: ["naturalminor", "harmonicminor", "melodicminor", "wholetone", "chromatic"] 
								)

	let FOUR = EAR_TRAINING_SETS(
									intervalmode: ["perfect"], 
									interval: ["fourth", "fifth"], 
									chordmode: [], 
									chord: [], 
									scalemode: ["lydian", "mixolydian"] 
								)
} 

