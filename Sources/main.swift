import Glibc
import Foundation

var TypesArray = [MajorScale(), MinorScale(), HarmonicMinorScale(), MelodicMinorScale()]

let NUM_FILE_ENTRY = 3
let NUM_TYPES = TypesArray.count

srandom(UInt32(time(nil)))

let randnum = random() % NUM_TYPES
let randidx = random() % NUM_FILE_ENTRY

var foo = TypesArray[randnum]
foo.readEntry(index: randidx)

#if AUDIO
print("Playing test mp3 file, please wait 16 seconds")
sleep(1)
let rc = foo.playAudio()
if rc == 0 {
	print("Playback successful")
} else {
	print("Playback unsuccessful")
}
#endif

print("Enter the scale type")
let response = readLine()
if foo.isCorrectType(guess: response!.lowercased()) {
	print("Correct!")
} else {
	print("Incorrect!")
}
