# Syllabus Prep

Syllabus Prep is way for students of the Oregon Music Teachers Association (OMTA) to study and prepare for their syllabus tests. Syllabus Prep will cover music theory for each syllabus level including ear training, rhythm training, and sight reading. This project is being developed in XCode in the Swift 3 language, and will eventually be released to the Apple Store.

## Author

* **Matthew Balleza** 

- *Initial work* - [mballeza](https://github.com/mballeza)

- *Contact info* - matthewballeza@gmail.com, mballeza.vm@gmail.com

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE.md](LICENSE.md) file for details

### Demo

See the "demo" branch for a Swift command-line simulation of concepts intended for the app release.

[mballeza/Syllabus-Prep/tree/demo](https://github.com/mballeza/Syllabus-Prep/tree/demo)

### Update 7/18/17

#### Current State

- Simple one-scene app for iOS 9.3 with one button for each level (10 total).

  - Ear training only: each button plays a random interval, chord, or scale.

  - Each level has its own set of intervals, chords, and/or scales based on the OMTA requirements.

#### Limitations

- MIDI note generation relies on a sleep call between notes. This is not ideal, and needs a better alternative in future updates.

- Cannot yet separate the random generation between intervals, chords, and scales; i.e. a user wanted to study some level *n* and wanted to only play intervals and not chords or scales.

#### To-do

- Create unit tests.

- Allow options to user to study single sets (intervals, chords, or scales individually).

- Improve UI.

  - Level selection moves to another scene.
  
  - Info to indicate current study session: level, study set, etc.
  
  - Navigation.

### Week 3 Update - 7/15/17

#### Current State

- Simple app for iOS 9.3 with a couple buttons.

#### Limitations

- App crashes after mp3 file is played for top button.

- App opens a quicktime player for the second button.

  - The intention for the play button is to play the sound on the same screen.
  
  - This button was created for educational exploration of different tools in XCode.

#### To-do

- Learn more about how iOS app creation works.

- Integrate the demo branch swift files into the xcode project on master branch.

#### See demo branch for more information on the Week 3 Update

## Useful Links

- (link to OMTA syllabus test requirements)

- (links to MIDI tools)

#### The following is the rest of the template from https://gist.github.com/PurpleBooth/109311bb0361f32d87a2

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

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

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc

