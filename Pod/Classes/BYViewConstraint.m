//
//  BYViewConstraint.swift
//  汎用Constraintレイアウト
//
//  Created by fukuda on 2014/11/20.
//  Copyright (c) 2014年 bylo media inc. All rights reserved.
//

#import "BYViewConstraint.h"

@implementation BYViewConstraint
{
	UIView* _superview;
	NSMutableArray* _constraints;
	UIView* _target;
}
	
- (id)initWithSuperview:(UIView*)superview {
	_superview = superview;
	_constraints = [NSMutableArray new];
	return self;
}

// ややこしいやつはこれ
- (BYViewConstraint*)complex:(NSLayoutAttribute)at to:(UIView*)toView at:(NSLayoutAttribute)toAt metric:(CGFloat)metric {
	[_constraints addObject:
		[NSLayoutConstraint
			constraintWithItem: _target
			attribute: at
			relatedBy: NSLayoutRelationEqual
			toItem: toView
			attribute: toAt
			multiplier: 1.0
			constant: metric]
			];
	return self;
}

- (BYViewConstraint*)layout:(NSLayoutAttribute)at to:(UIView*)toView at:(NSLayoutAttribute)toAt metric:(float)metric {
   return [self complex:at to:toView at:toAt metric:metric];
}

- (BYViewConstraint*)layout:(NSLayoutAttribute)at to:(UIView*)toView at:(NSLayoutAttribute)toAt {
   return [self complex:at to:toView at:toAt metric:(CGFloat)0.0];
}

- (BYViewConstraint*)apply {
	[_superview addConstraints:_constraints];
	return self;
}

- (BYViewConstraint*)clear {
	[_superview removeConstraints:_constraints];
	[_constraints removeAllObjects];
	return self;
}

- (BYViewConstraint*)view:(UIView*)view {
	[view setTranslatesAutoresizingMaskIntoConstraints:false];
	_target = view;
	return self;
}

// @param axis .CenterX, .CenterY
- (BYViewConstraint*)centerX { return [self centerX:_superview]; }
- (BYViewConstraint*)centerY { return [self centerY:_superview]; }

- (BYViewConstraint*)centerX:(UIView*)view { return [self centerX:view offset:0]; }
- (BYViewConstraint*)centerY:(UIView*)view { return [self centerY:view offset:0]; }

- (BYViewConstraint*)centerX:(UIView*)view offset:(CGFloat)offset {
	 return [self center:NSLayoutAttributeCenterX to:view offset:offset];
}
- (BYViewConstraint*)centerY:(UIView*)view offset:(CGFloat)offset {
	 return [self center:NSLayoutAttributeCenterY to:view offset:offset];
}

- (BYViewConstraint*)center:(NSLayoutAttribute)axis to:(UIView*)view offset:(CGFloat)offset {
	 return [self complex:axis to:view at:axis metric:offset];
}

// view の左を attachTo の右に揃える
- (BYViewConstraint*)attachLeft:(UIView*)to offset:(CGFloat)offset {
	return [self complex:NSLayoutAttributeLeft to:to at:NSLayoutAttributeRight metric:offset];
}
- (BYViewConstraint*)attachRight:(UIView*)to offset:(CGFloat)offset {
	return [self complex:NSLayoutAttributeRight to:to at:NSLayoutAttributeLeft metric:offset];
}
- (BYViewConstraint*)attachTop:(UIView*)to offset:(CGFloat)offset {
	return [self complex:NSLayoutAttributeTop to:to at:NSLayoutAttributeBottom metric:offset];
}
- (BYViewConstraint*)attachBottom:(UIView*)to offset:(CGFloat)offset {
	return [self complex:NSLayoutAttributeBottom to:to at:NSLayoutAttributeTop metric:offset];
}

// for objc
- (BYViewConstraint*)attachLeft:(UIView*)to { return [self attachLeft:to offset:0]; }
- (BYViewConstraint*)attachRight:(UIView*)to { return [self attachRight:to offset:0]; }
- (BYViewConstraint*)attachTop:(UIView*)to { return [self attachTop:to offset:0]; }
- (BYViewConstraint*)attachBottom:(UIView*)to { return [self attachBottom:to offset:0]; }

// view の左を alignTo の左に揃える
- (BYViewConstraint*)left:(UIView*)alignTo offset:(CGFloat)offset {
	return [self complex:NSLayoutAttributeLeft to:[self asToView:alignTo] at:NSLayoutAttributeLeft metric:offset];
}
- (BYViewConstraint*)right:(UIView*)alignTo offset:(CGFloat)offset {
	return [self complex:NSLayoutAttributeRight to:[self asToView:alignTo] at:NSLayoutAttributeRight metric:offset];
}
- (BYViewConstraint*)top:(UIView*)alignTo offset:(CGFloat)offset {
	return [self complex:NSLayoutAttributeTop to:[self asToView:alignTo] at:NSLayoutAttributeTop metric:offset];
}
- (BYViewConstraint*)bottom:(UIView*)alignTo offset:(CGFloat)offset {
	return [self complex:NSLayoutAttributeBottom to:[self asToView:alignTo] at:NSLayoutAttributeBottom metric:offset];
}

- (BYViewConstraint*)left:(UIView*)alignTo { return [self left:alignTo offset:0]; }
- (BYViewConstraint*)right:(UIView*)alignTo { return [self right:alignTo offset:0]; }
- (BYViewConstraint*)top:(UIView*)alignTo { return [self top:alignTo offset:0]; }
- (BYViewConstraint*)bottom:(UIView*)alignTo { return [self bottom:alignTo offset:0]; }

- (BYViewConstraint*)left { return [self left:nil offset:0]; }
- (BYViewConstraint*)right { return [self right:nil offset:0]; }
- (BYViewConstraint*)top { return [self top:nil offset:0]; }
- (BYViewConstraint*)bottom { return [self bottom:nil offset:0]; }

// 横いっぱい
- (BYViewConstraint*)fullWidth {
	[self complex:NSLayoutAttributeLeft to:_superview at:NSLayoutAttributeLeft metric:0];
	[self complex:NSLayoutAttributeRight to:_superview at:NSLayoutAttributeRight metric:0];
	return self;
}
// 縦いっぱい
- (BYViewConstraint*)fullHeight {
	[self complex:NSLayoutAttributeTop to:_superview at:NSLayoutAttributeTop metric:0];
	[self complex:NSLayoutAttributeBottom to:_superview at:NSLayoutAttributeBottom metric:0];
	return self;
}

// 幅指定
- (BYViewConstraint*)width {
	return [self size:NSLayoutAttributeWidth value:nil];
}
- (BYViewConstraint*)width:(CGFloat)value {
	return [self size:NSLayoutAttributeWidth value:&value];
}

// 高さ指定
- (BYViewConstraint*)height {
	return [self size:NSLayoutAttributeHeight value:nil];
}
- (BYViewConstraint*)height:(CGFloat)value {
	return [self size:NSLayoutAttributeHeight value:&value];
}

- (BYViewConstraint*)size:(NSLayoutAttribute)axis value:(CGFloat*)valuePtr {
	CGFloat size = 0;
	if (valuePtr == nil) {
		size = (axis == NSLayoutAttributeWidth ? _target.bounds.size.width : _target.bounds.size.height);
	}
	else {
		size = *valuePtr;
	}
	return [self complex:axis to:nil at:NSLayoutAttributeNotAnAttribute metric:size];
}

- (UIView*)asToView:(UIView*)toView {
	if (toView != nil) {
		return toView;
	}
	return _superview;
}

@end
