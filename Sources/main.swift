import Foundation

print("Enter your level")
let userLevel = Int(readLine()!)
var toContinue : String

let StudySession = EarTraining(level: userLevel!)

if !StudySession.assertLevel(level: userLevel!) {
	exit(1)
}

print("Enter which set to study. Enter -100 to study all.")
var studySet : Int
repeat {
	StudySession.displayChoices()
	studySet = Int(readLine()!)!
} while !StudySession.isValidSet(choice: studySet) && studySet != -100

if studySet < 0 {
	repeat {
		StudySession.giveTestQuestion()
		toContinue = readLine()!
	} while toContinue == "n"
} else {
	repeat {
		StudySession.giveTestQuestion(choice: studySet)
		toContinue = readLine()!
	} while toContinue == "n"
}
