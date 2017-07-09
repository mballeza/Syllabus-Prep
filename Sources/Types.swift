import Foundation 

class Types {
	internal var filename: String?
	internal var stringType: String?

	init() {
		filename = "default"
		stringType = "default"
	}

	internal func readEntry(name : String, index : Int) {
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

	internal func printScale(index: Int) {}
	func printFileName() {}
	func isCorrectType(guess: String) -> Bool {
		return guess == stringType
	}
}

class MajorScale : Types {
	override init() {
		super.init()
		filename = "majorscales"
		stringType = "major"
	}

	override func printScale(index : Int) {
		readEntry(name: filename!, index: index)
	}

	override func printFileName() {
		print(filename! + ".txt")
	}
}

class MinorScale : Types {
	override init() {
		super.init()
		filename = "minorscales"
		stringType = "minor"
	}

	override func printScale(index : Int) {
		readEntry(name: filename!, index: index)
	}

	override func printFileName() {
		print(filename! + ".txt")
	}
}
