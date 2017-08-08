# Syllabus Prep

Syllabus Prep is way for students of the Oregon Music Teachers Association (OMTA) to study and prepare for their syllabus tests. Syllabus Prep will cover music theory for each syllabus level including ear training, rhythm training, and sight reading. This project is being developed in XCode in the Swift 3 language, and will eventually be released to the Apple Store.

## Author

* **Matthew Balleza** 

- *Initial work* - [mballeza](https://github.com/mballeza)

- *Contact info* - matthewballeza@gmail.com, mballeza.vm@gmail.com

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

This project includes third part open source software components: MIDISampler.swift. This file has been modified under permission of the MIT License. Please see [Third-Party-License/LICENSE-DeLisa](Third-Party-License/LICENSE-DeLisa)

### Demo

See the "demo" branch for a Swift command-line simulation of concepts intended for the app release.

[mballeza/Syllabus-Prep/tree/demo](https://github.com/mballeza/Syllabus-Prep/tree/demo)

### Update 8/7/17

#### Current State

##### UI

- 3 scenes to navigate:

  - Main menu. Here the user selects which Syllabus level to study for.
  
  - Level menu. Here the user selects to study Ear Training, Rhythm Training, or Sight Reading. Currently, only the Ear Training session has been implemented.
  
  - Ear Training. Here the user selects which type to study for: intervals, chords, or scales (modes). The user can study one type or multiple (randomly chosen and generated). There are four buttons to choose from. One has the correct answer, two have a random incorrect answer of the same type, and one is a fake term.
  
##### Implementation

- Music Theory structures

  - Intervals, chords, and scales all now use a tuple "setTuple": (String, [Int8]).
  
  - Names of all intervals, chords, and scales can be accessed by the struct definition individually or by an array (for random retrieval).
  
- MIDI sampler

  - Play interval, chord, or scale have separate functions.
   
  - Intervals and chords play notes separately then together.
    
  - Scales play notes individually.

#### Limitations

- MIDI note generation relies on a sleep call between notes. This is not ideal, and needs a better alternative in future updates.

- UI is very basic and has constraint issues.

- Error prevention is limited.

#### To-do

- Update unit tests.

- Improve UI.

  - Fix constraint issues.
  
- Rhythm Training

  - The plan is to be able to display randomly generated(?) rhythms with notes on a staff.
  
- Sight Reading

  - The plan is to be able to display composed pieces to students to read.

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

