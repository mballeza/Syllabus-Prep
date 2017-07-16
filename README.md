# Syllabus Prep

Syllabus Prep is way for students of the Oregon Music Teachers Association (OMTA) to study and prepare for their syllabus tests. Syllabus Prep will cover music theory for each syllabus level including scales, arpeggios, chord progressions, and ear training. This project is intended for development in the Swift language, and will eventually be released to the Apple Store.

#### See Week 3 Update below for a brief description of the current functionality as of 7/16/2017.

## Authors

* **Matthew Balleza** 

- *Initial work* - [mballeza](https://github.com/mballeza)

- *Contact info* - matthewballeza@gmail.com

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE.md](LICENSE.md) file for details

### Prerequisites

This demo was developed with Swift 3.1.1 Ubuntu 16.04 Release version. This can be downloaded at https://swift.org/download, and the installation instructions can be found at https://swift.org/download/#using-downloads.

To use the audio version of the make target, mpg123 is needed. To get use:

```
sudo apt install mpg321
```

### Installing

To build an executable, you can do the following:

#### Makefile

To make the default target

```
make
```

#### Removed audio target from build, 7/11/2017
To make the audio target (mpg123 needed)

```
make audio
```

To remove executables

```
make clean
```

### Week 3 Update

#### Progress

- Program allows levels 1-10 for ear training only.

- Demo picks a random set of intervals, chords, or scales based on the user's focus of study.

  - Can study all the requirements of a level or one set (interval, chord, or scale).
  
- Prompting a test question will display the note names on screen rather than play audio.

#### Limitations

- No audio is played, so it isn't exactly "ear training" quite yet.

- Incomplete set of text files that contain the notes to random intervals, chords, and scales.

- Improper UI to run multiple test questions.

  - To change levels, you have to exit and run the program again.

#### To-do

- Create unit tests.

- Integrate swift files with master branch.

- Decide how audio playback will work for xcode project.

  - Creating .midi or .mp3 files of all the different intervals, chords, and scales is inefficient and takes up a lot of space, but is the simplest solution to start out with.
  
  - Generating MIDI sounds is ideal, but needs more exploring and study. See Gene De Lisa's [repositories](https://github.com/genedelisa?utf8=%E2%9C%93&tab=repositories&q=MIDI&type=&language=swift) related to MIDI with the Swift language.

- Decide how visual notes will be displayed for xcode project.

  - These are intended for future addititions to the Syllabus Prep project: rhythm training and sight reading.


#### The following is the rest of the template from https://gist.github.com/PurpleBooth/109311bb0361f32d87a2

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc

