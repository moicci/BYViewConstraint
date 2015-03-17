//
//  ViewController.m
//  ObjcDemo
//
//  Created by fukuda on 2015/03/17.
//  Copyright (c) 2015年 bylo media inc. All rights reserved.
//

#import "ViewController.h"
#import "ObjcDemo-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self setupLayout];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)setupLayout {
	UILabel* topLabel = [self addLabel:@"fullWidth/top" backColor:[UIColor redColor]];
	UILabel* bottomLabel = [self addLabel:@"fullWidth/bottom" backColor:[UIColor redColor]];
	UILabel* centerLabel = [self addLabel:@"centerX/Y" backColor:[UIColor blueColor]];
	UILabel* leftLabel = [self addLabel:@"left" backColor:[UIColor greenColor]];
	UILabel* rightLabel = [self addLabel:@"right" backColor:[UIColor greenColor]];
	
	BYViewConstraint* constraint = [[BYViewConstraint alloc] initWithSuperview:self.view];
	
	// topLabel
	[constraint fullWidth:topLabel];
	[constraint top:topLabel alignTo:nil offset:0];
	[constraint height:topLabel value:50];
	// bottomLabel
	[constraint fullWidth:bottomLabel];
	[constraint bottom:bottomLabel alignTo:nil offset:0];
	[constraint height:bottomLabel value:50];
	// centerLabel
	[constraint centerX:centerLabel];
	[constraint centerY:centerLabel];
	[constraint width:centerLabel value:150];
	[constraint height:centerLabel value:150];
	// leftLabel
	[constraint top:leftLabel attachTo:topLabel offset:0];
	[constraint bottom:leftLabel attachTo:bottomLabel offset:0];
	[constraint left:leftLabel alignTo:nil offset:0];
	[constraint right:leftLabel attachTo:centerLabel offset:0];
	// rightLabel
	[constraint top:rightLabel attachTo:topLabel offset:0];
	[constraint bottom:rightLabel attachTo:bottomLabel offset:0];
	[constraint left:rightLabel attachTo:centerLabel offset:0];
	[constraint right:rightLabel alignTo:nil offset:0];
	// apply
	[constraint apply];
}

- (UILabel*)addLabel:(NSString*)text backColor:(UIColor*)backColor {
	UIColor* textColor = [UIColor whiteColor];
	UILabel* label = [[UILabel alloc] initWithFrame:self.view.bounds];
	label.text = text;
	label.textColor = textColor;
	label.backgroundColor = backColor;
	label.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:label];
	return label;
}

@end

