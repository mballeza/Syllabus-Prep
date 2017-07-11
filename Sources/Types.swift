import Foundation 

class Types {
	internal var filename: String?
	var stringType: String?

	init() {
		filename = ""
		stringType = ""
	}

	init(SyllabusSet: [[String]]) {
		
	}

	func readEntry(index : Int) {
		if let path = Bundle.main.path(forResource: filename!, ofType: "txt") {
			do {
				let data = try String(contentsOfFile: path, encoding: .utf8)
				let entry = data.components(separatedBy: .newlines)
				print(entry[index])
			} catch {
				print(error)
			}
		} else {
			print("File " + filename! + " not found")
		}
	}

	func isCorrectType(guess: String) -> Bool {
		return guess == stringType
	}

#if AUDIO
	func playAudio() -> Int32 {
		return shell("mpg123", "-q", "Resources/test.mp3")
	}

	private func shell(_ args: String...) -> Int32 {
		let task = Process()
		task.launchPath = "/usr/bin/env"
		task.arguments = args
		task.launch()
		task.waitUntilExit()
		return task.terminationStatus
 	}
#endif
}

class Scale : Types {
	override init() {
		super.init()
		filename = "scales"
		stringType = "scale"
	}
}

class Interval: Types {
	override init() {
		super.init()
		filename = "intervals"
		stringType = "interval"
	}
}

class Triad: Types {
	override init() {
		super.init()
		filename = "triads"
		stringType = "triad"
	}
}

class MajorScale : Scale {
	override init() {
		super.init()
		filename = "major" + super.filename!
		stringType = "major " + super.stringType!
	}
}

class MinorScale : Scale{
	override init() {
		super.init()
		filename = "minor" + super.filename!
		stringType = "minor " + super.stringType!
	}
}

class HarmonicMinorScale : Scale {
	override init() {
		super.init()
		filename = "harmonicminor" + super.filename!
		stringType = "harmonic minor " + super.stringType!
	}
}

class MelodicMinorScale : Scale {
	override init() {
		super.init()
		filename = "melodicminor" + super.filename!
		stringType = "melodic minor " + super.stringType!
	}
}
