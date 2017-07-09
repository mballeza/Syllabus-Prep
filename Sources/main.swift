import Glibc

var TypesArray = [MajorScale(), MinorScale()]

let NUM_FILE_ENTRY = 3
let NUM_TYPES = TypesArray.count

srandom(UInt32(time(nil)))

let randnum = random() % NUM_TYPES
let randidx = random() % NUM_FILE_ENTRY

var foo = TypesArray[randnum]
foo.printScale(index: randidx)

print("Is this scale major or minor?")
let response = readLine()
if foo.isCorrectType(guess: response!) {
	print("Correct!")
} else {
	print("Incorrect!")
}
