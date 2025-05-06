# About
A single screen iOS app for showing a shakespearean version of a Pokémon.

Uses [shakespearemon-sdk](https://github.com/scarayaa/shakespearemon-sdk) to retrieve Pokémon and translations data.

## How to run it

Simply open `shakespearemon-ios.xcodeproj` and run.

## Architecture

The app is entirely built using SwiftUI. The only available screen uses a MVVM pattern (without coordinators since it's a single screen app) implemented using the recent SwiftUI Observation pattern.