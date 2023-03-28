
# react-native-the-mayon-tour

## Getting started

`$ npm install react-native-the-mayon-tour --save`

### Mostly automatic installation

`$ react-native link react-native-the-mayon-tour`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-the-mayon-tour` and add `RNTheMayonTour.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNTheMayonTour.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNTheMayonTourPackage;` to the imports at the top of the file
  - Add `new RNTheMayonTourPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-the-mayon-tour'
  	project(':react-native-the-mayon-tour').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-the-mayon-tour/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-the-mayon-tour')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNTheMayonTour.sln` in `node_modules/react-native-the-mayon-tour/windows/RNTheMayonTour.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using The.Mayon.Tour.RNTheMayonTour;` to the usings at the top of the file
  - Add `new RNTheMayonTourPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNTheMayonTour from 'react-native-the-mayon-tour';

// TODO: What to do with the module?
RNTheMayonTour;
```
  