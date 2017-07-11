import Foundation

print("Enter your level")
let userLevel = Int(readLine()!)

let StudySession = EarTraining(level: userLevel!)

if !StudySession.assertLevel(level: userLevel!) {
	exit(1)
}

StudySession.giveTestQuestion()
