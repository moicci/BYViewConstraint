# BYViewConstraint

BYViewConstraint is covenient class to implement the "Auto Layout" as below.

```swift
var constraint = BYViewConstraint(superview:self.view)
let topLabel = addLabel("fullWidth/top", backColor:UIColor.redColor())
let bottomLabel = addLabel("fullWidth/bottom", backColor:UIColor.redColor())
let centerLabel = addLabel("centerX/Y", backColor:UIColor.blueColor())
let leftLabel = addLabel("left", backColor:UIColor.greenColor())
let rightLabel = addLabel("right", backColor:UIColor.greenColor())

constraint
    // topLabel
    .fullWidth(topLabel)
    .top(topLabel)
    .height(topLabel, value:50)
    // bottomLabel
    .fullWidth(bottomLabel)
    .bottom(bottomLabel)
    .height(bottomLabel, value:50)
    // centerLabel
    .centerX(centerLabel)
    .centerY(centerLabel)
    .width(centerLabel, value:150)
    .height(centerLabel, value:150)
    // leftLabel
    .top(leftLabel, attachTo:topLabel)
    .bottom(leftLabel, attachTo:bottomLabel)
    .left(leftLabel)
    .right(leftLabel, attachTo:centerLabel)
    // rightLabel
    .top(rightLabel, attachTo:topLabel)
    .bottom(rightLabel, attachTo:bottomLabel)
    .left(rightLabel, attachTo:centerLabel)
    .right(rightLabel)
    // apply constraint
    .apply()
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

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

