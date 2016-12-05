# CCTV API

### Installation
CCTV-IOS requires [SWIFT 3.0](http://www.apple.com/swift/).

Install the dependencies to build application.
**NOTE:** Make sure Xcode is closed during these installations

```sh
$ cd CCTV/cctv-ios
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ sudo gem install cocoapods
pod install
open cctv-ios
--> double click on cctv-ios.xcworkspace
```

**Troubleshoot** 
```sh
1. close Xcode
2. delete contents of Pods folder
3. pod install
```

**NOTE:** Ask cctv-api needs to be running for app to work

### Technology

CCTV uses a number of open source projects to work properly:

* [Brew] - The missing package manager for macOS
* [EVReflection] - Reflection based JSON encoding and decoding. Including support for NSDictionary, NSCoding, Printable, Hashable and Equatable
* [Gem] - Package manager for ruby
* [Cocoa] - CocoaPods is a dependency manager for Swift
* [iOS] - iPhone operating system


   [EVReflection]: <https://github.com/evermeer/EVReflection>
   [Brew]: <http://brew.sh/>
   [Gem]: <https://rubygems.org/>
   [Cocoa]: <https://cocoapods.org/>
   [iOS]: <http://www.apple.com/ios/ios-10/>
  