import Foundation

print("Enter your level")
let userLevel = Int(readLine()!)
var toContinue : String

let StudySession = EarTraining(level: userLevel!)

if !StudySession.assertLevel(level: userLevel!) {
	exit(1)
}

repeat {
	StudySession.giveTestQuestion()
	toContinue = readLine()!
} while toContinue == "n"
