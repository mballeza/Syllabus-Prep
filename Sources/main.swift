import Foundation

print("Enter your level")
let userLevel = Int(readLine()!)

let StudySession = SyllabusLevels(level: userLevel!)

if !StudySession.assertLevel() {
	exit(1)
}

StudySession.giveTestQuestion()
