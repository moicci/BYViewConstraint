//
//  BYViewConstraint.h
//
//  Created by fukuda on 2015/03/17.
//  Copyright - (c) 2015年 bylo media inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYViewConstraint : NSObject

- (id)initWithSuperview:(UIView*)superview;

// どんなパターンでもOK
- (BYViewConstraint*)complex:(NSLayoutAttribute)at to:(UIView*)toView at:(NSLayoutAttribute)toAt metric:(CGFloat)metric;
- (BYViewConstraint*)layout:(NSLayoutAttribute)at to:(UIView*)toView at:(NSLayoutAttribute)toAt metric:(float)metric;
- (BYViewConstraint*)layout:(NSLayoutAttribute)at to:(UIView*)toView at:(NSLayoutAttribute)toAt;

// 制約を適用
- (BYViewConstraint*)apply;

// 制約を解除
- (BYViewConstraint*)clear;

// 今から対象とするviewを設定
- (BYViewConstraint*)view:(UIView*)view;

// superview の中央に置く
- (BYViewConstraint*)centerX;
- (BYViewConstraint*)centerY;

- (BYViewConstraint*)centerX:(UIView*)to;
- (BYViewConstraint*)centerY:(UIView*)to;

- (BYViewConstraint*)centerX:(UIView*)to offset:(CGFloat)offset;
- (BYViewConstraint*)centerY:(UIView*)to offset:(CGFloat)offset;

// view の左を to の右に揃える
- (BYViewConstraint*)attachLeft:(UIView*)to offset:(CGFloat)offset;
- (BYViewConstraint*)attachRight:(UIView*)to offset:(CGFloat)offset;
- (BYViewConstraint*)attachTop:(UIView*)to offset:(CGFloat)offset;
- (BYViewConstraint*)attachBottom:(UIView*)to offset:(CGFloat)offset;

- (BYViewConstraint*)attachLeft:(UIView*)to;
- (BYViewConstraint*)attachRight:(UIView*)to;
- (BYViewConstraint*)attachTop:(UIView*)to;
- (BYViewConstraint*)attachBottom:(UIView*)to;

// view の左を to の左に揃える
- (BYViewConstraint*)left:(UIView*)to offset:(CGFloat)offset;
- (BYViewConstraint*)right:(UIView*)to offset:(CGFloat)offset;
- (BYViewConstraint*)top:(UIView*)to offset:(CGFloat)offset;
- (BYViewConstraint*)bottom:(UIView*)to offset:(CGFloat)offset;

- (BYViewConstraint*)left:(UIView*)to;
- (BYViewConstraint*)right:(UIView*)to;
- (BYViewConstraint*)top:(UIView*)to;
- (BYViewConstraint*)bottom:(UIView*)to;

- (BYViewConstraint*)left;
- (BYViewConstraint*)right;
- (BYViewConstraint*)top;
- (BYViewConstraint*)bottom;

// 横いっぱい
- (BYViewConstraint*)fullWidth;

// 縦いっぱい
- (BYViewConstraint*)fullHeight;

// 幅指定
- (BYViewConstraint*)width;
- (BYViewConstraint*)width:(CGFloat)value;

// 高さ指定
- (BYViewConstraint*)height;
- (BYViewConstraint*)height:(CGFloat)value;

@end


