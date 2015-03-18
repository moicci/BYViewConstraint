# BYViewConstraint

BYViewConstraint is covenient class to implement the "Auto Layout" as below.

```swift
let topLabel = addLabel("fullWidth/top", backColor:UIColor.redColor())
let bottomLabel = addLabel("fullWidth/bottom", backColor:UIColor.redColor())
let centerLabel = addLabel("centerX/Y", backColor:UIColor.blueColor())
let leftLabel = addLabel("left", backColor:UIColor.greenColor())
let rightLabel = addLabel("right", backColor:UIColor.greenColor())

let constraint = BYViewConstraint(superview:self.view)

constraint.view(topLabel)
    .fullWidth()
    .top()
    .height(50)

constraint.view(bottomLabel)
    .fullWidth()
    .bottom()
    .height(50)

constraint.view(centerLabel)
    .centerX()
    .centerY()
    .width(150)
    .height(150)

constraint.view(leftLabel)
    .top(topLabel)
    .bottom(bottomLabel)
    .left()
    .right(centerLabel)

constraint.view(rightLabel)
    .top(topLabel)
    .bottom(bottomLabel)
    .left(centerLabel)
    .right()

constraint.apply()
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

If you install this library by CocoaPods, clone the repo from <https://github.com/moicci/BYViewConstraint> for the Example.

- for Swift user: see ViewController.swift in the sub-directory 'SwiftDemo'.
- for Objective-C user: see ViewController.m in the sub-directory 'ObjcDemo'.

## Installation

BYViewConstraint is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "BYViewConstraint"
    use_frameworks!

`use_frameworks!` is needed because BYViewConstraint is Swift class.

### for Swift Project

- Add `import BYViewConstraint` in your swift file using BYViewConstraint.

### for Objective-C Project

- Add BYViewConstraint.swift in your project.
- Add `#import "<Project Name>-Swift.h"` in your .m file using BYViewConstraint.

**Let me know how to integrate a pod based on Swift into Objective-C project.**

## Author

Moicci at bylo media inc.

## License

BYViewConstraint is available under the MIT license. See the LICENSE file for more info.

