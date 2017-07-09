import Foundation 

class Types {
	internal var filename: String?
	internal var stringType: String?

	init() {
		filename = "default"
		stringType = "default"
	}

	func readEntry(index : Int) {
		if let path = Bundle.main.path(forResource: filename!, ofType: "txt", inDirectory: "Resources") {
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
		return shell("mpg123", "Resources/test.mp3")
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

class MajorScale : Types {
	override init() {
		super.init()
		filename = "majorscales"
		stringType = "major"
	}
}

class MinorScale : Types {
	override init() {
		super.init()
		filename = "minorscales"
		stringType = "minor"
	}
}

class HarmonicMinorScale : Types {
	override init() {
		super.init()
		filename = "harmonicminorscales"
		stringType = "harmonic minor"
	}
}

class MelodicMinorScale : Types {
	override init() {
		super.init()
		filename = "melodicminorscales"
		stringType = "melodic minor"
	}
}
