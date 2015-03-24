//
//  ViewController.m
//  ObjcDemo
//
//  Created by fukuda on 2015/03/17.
//  Copyright (c) 2015年 bylo media inc. All rights reserved.
//

#import "ViewController.h"
#import "BYViewConstraint.h"

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

