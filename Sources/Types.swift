import Foundation 

// Temporary class, this is probably Ear Training specific, so I might combine the two classes.
class Types {
	internal var filename: String?
	var stringType1: String?
	var stringType2: String?

	init() {
		filename = ""
		stringType1 = ""
		stringType2 = ""
	}

	init(firstname: String, secondname: String) {
		filename = firstname + secondname
		stringType1 = firstname
		stringType2 = secondname
	}

	func isEmpty() -> Bool {
		return filename == ""
	}

	// This is for demo only. For ear training, a similar function would play an mp3, wav, or midi.
	func readEntry(index : Int) -> Bool {
		var flag = false
		if let path = Bundle.main.path(forResource: filename!, ofType: "txt") {
			do {
				let data = try String(contentsOfFile: path, encoding: .utf8)
				let entry = data.components(separatedBy: .newlines)
				print(entry[index])
				flag = true
			} catch {
				print(error)
			}
		} else {
			print("File " + filename! + " not found")
		}
		return flag
	}

	// User can enter the mode or type. Example: "minor", or "minor scale" would return a correct
	//   answer if the type was indeed a minor scale.
	func isCorrectType(guess: String) -> Bool {
		return guess == stringType1! || guess == stringType1! + " " + stringType2!
	}

	// For the audio demo, just plays a test mp3.
#if AUDIO
	func playAudio() -> Int32 {
		return shell("mpg123", "-q", "test.mp3")
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
