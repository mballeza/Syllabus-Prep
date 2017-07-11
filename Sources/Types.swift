import Foundation 

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
		return guess == stringType1! || guess == stringType1! + " " + stringType2!
	}

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
