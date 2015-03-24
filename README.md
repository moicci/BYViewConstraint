# BYViewConstraint

BYViewConstraint is covenient class to implement the "Auto Layout" in Objective-C as below.

```objc
	UILabel* topLabel = [self addLabel:@"fullWidth/top" backColor:[UIColor redColor]];
	UILabel* bottomLabel = [self addLabel:@"fullWidth/bottom" backColor:[UIColor redColor]];
	UILabel* centerLabel = [self addLabel:@"centerX/Y" backColor:[UIColor blueColor]];
	UILabel* leftLabel = [self addLabel:@"left" backColor:[UIColor greenColor]];
	UILabel* rightLabel = [self addLabel:@"right" backColor:[UIColor greenColor]];
	
	BYViewConstraint* constraint = [[BYViewConstraint alloc] initWithSuperview:self.view];
	
	[constraint view:topLabel];
	[constraint fullWidth];
	[constraint top];
	[constraint height:50];

	[constraint view:bottomLabel];
	[constraint fullWidth];
	[constraint bottom];
	[constraint height:50];

	[constraint view:centerLabel];
	[constraint centerX];
	[constraint centerY];
	[constraint width:150];
	[constraint height:150];

	[constraint view:leftLabel];
	[constraint attachTop:topLabel];
	[constraint attachBottom:bottomLabel];
	[constraint left];
	[constraint attachRight:centerLabel];

	[constraint view:rightLabel];
	[constraint attachTop:topLabel];
	[constraint attachBottom:bottomLabel];
	[constraint attachLeft:centerLabel];
	[constraint right];

	[constraint apply];
```

Or in Swift.

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
    .attachTop(topLabel)
    .attachBottom(bottomLabel)
    .left()
    .attachRight(centerLabel)

constraint.view(rightLabel)
    .attachTop(topLabel)
    .attachBottom(bottomLabel)
    .attachLeft(centerLabel)
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

then install the pod.

```
pod install
```

### for Swift Project

- Add `import "BYViewConstraint.h"` into your Objective-C bridging header file (<Project Name>-Bridging-Header.h).

### for Objective-C Project

- Add `#import "BYViewConstraint.h"` in your .m file using BYViewConstraint.

## Author

Moicci at bylo media inc.

## License

BYViewConstraint is available under the MIT license. See the LICENSE file for more info.

