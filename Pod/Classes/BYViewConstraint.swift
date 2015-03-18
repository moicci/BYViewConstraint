//
//  BYViewConstraint.swift
//  汎用Constraintレイアウト
//
//  Created by fukuda on 2014/11/20.
//  Copyright (c) 2014年 bylo media inc. All rights reserved.
//

import UIKit

@objc public class BYViewConstraint: NSObject {

	public enum Axis : UInt {
		case H
		case V

		func center() -> NSLayoutAttribute {
			switch self {
				case H:	return .CenterX
				case V:	return .CenterY
			}
		}
		func size() -> NSLayoutAttribute {
			switch self {
				case H:	return .Width
				case V:	return .Height
			}
		}
	}

	private let superview:UIView
	private var constraints:[AnyObject] = []
	private var target:UIView?
	
	public init(superview:UIView) {
		self.superview = superview
	}

	// ややこしいやつはこれ
	public func complex(at:NSLayoutAttribute, to toView:UIView!, at toAt:NSLayoutAttribute, metric:CGFloat = 0) -> BYViewConstraint {
		self.constraints.append(NSLayoutConstraint(
                item: self.target!,
                attribute: at,
                relatedBy: .Equal,
                toItem: toView,
                attribute: toAt,
                multiplier: 1.0,
                constant: metric
            ))
		return self;
	}

	public func apply() -> BYViewConstraint {
		self.superview.addConstraints(self.constraints)
		return self
	}

	public func clear() -> BYViewConstraint {
		self.superview.removeConstraints(self.constraints)
		self.constraints = []
		return self
	}

	public func view(view:UIView) -> BYViewConstraint {
		view.setTranslatesAutoresizingMaskIntoConstraints(false)
		self.target = view;
		return self;
	}

	// @param axis .CenterX, .CenterY
	public func centerX() -> BYViewConstraint {
		return center(.H)
	}
	public func centerY() -> BYViewConstraint {
		return center(.V)
	}

	public func center(axis:Axis) -> BYViewConstraint {
		return complex(axis.center(), to:self.superview, at:axis.center())
	}

	// view の左を attachTo の右に揃える
	public func left(attachTo:UIView, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(.Left, to:attachTo, at:.Right, metric:offset)
	}
	public func right(attachTo:UIView, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(.Right, to:attachTo, at:.Left, metric:offset)
	}
	public func top(attachTo:UIView, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(.Top, to:attachTo, at:.Bottom, metric:offset)
	}
	public func bottom(attachTo:UIView, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(.Bottom, to:attachTo, at:.Top, metric:offset)
	}

	// for objc
	public func attachLeft(to:UIView, offset:CGFloat) -> BYViewConstraint { return left(to, offset:offset) }
	public func attachRight(to:UIView, offset:CGFloat) -> BYViewConstraint { return right(to, offset:offset) }
	public func attachTop(to:UIView, offset:CGFloat) -> BYViewConstraint { return top(to, offset:offset) }
	public func attachBottom(to:UIView, offset:CGFloat) -> BYViewConstraint { return bottom(to, offset:offset) }

	public func attachLeft(to:UIView) -> BYViewConstraint { return left(to, offset:0) }
	public func attachRight(to:UIView) -> BYViewConstraint { return right(to, offset:0) }
	public func attachTop(to:UIView) -> BYViewConstraint { return top(to, offset:0) }
	public func attachBottom(to:UIView) -> BYViewConstraint { return bottom(to, offset:0) }

	// view の左を alignTo の左に揃える
	public func left(alignTo:UIView? = nil, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(.Left, to:asToView(alignTo), at:.Left, metric:offset)
	}
	public func right(alignTo:UIView? = nil, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(.Right, to:asToView(alignTo), at:.Right, metric:offset)
	}
	public func top(alignTo:UIView? = nil, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(.Top, to:asToView(alignTo), at:.Top, metric:offset)
	}
	public func bottom(alignTo:UIView? = nil, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(.Bottom, to:asToView(alignTo), at:.Bottom, metric:offset)
	}

	// for objc
	public func alignLeft(to:UIView, offset:CGFloat) -> BYViewConstraint { return left(alignTo:to, offset:offset) }
	public func alignRight(to:UIView, offset:CGFloat) -> BYViewConstraint { return right(alignTo:to, offset:offset) }
	public func alignTop(to:UIView, offset:CGFloat) -> BYViewConstraint { return top(alignTo:to, offset:offset) }
	public func alignBottom(to:UIView, offset:CGFloat) -> BYViewConstraint { return bottom(alignTo:to, offset:offset) }

	public func alignLeft(to:UIView) -> BYViewConstraint { return left(alignTo:to, offset:0) }
	public func alignRight(to:UIView) -> BYViewConstraint { return right(alignTo:to, offset:0) }
	public func alignTop(to:UIView) -> BYViewConstraint { return top(alignTo:to, offset:0) }
	public func alignBottom(to:UIView) -> BYViewConstraint { return bottom(alignTo:to, offset:0) }

	public func alignLeft() -> BYViewConstraint { return left(alignTo:nil, offset:0) }
	public func alignRight() -> BYViewConstraint { return right(alignTo:nil, offset:0) }
	public func alignTop() -> BYViewConstraint { return top(alignTo:nil, offset:0) }
	public func alignBottom() -> BYViewConstraint { return bottom(alignTo:nil, offset:0) }

	// 横いっぱい
	public func fullWidth() -> BYViewConstraint {
		complex(.Left, to:self.superview, at:.Left)
		complex(.Right, to:self.superview, at:.Right)
		return self
	}
	// 縦いっぱい
	public func fullHeight() -> BYViewConstraint {
		complex(.Top, to:self.superview, at:.Top)
		complex(.Bottom, to:self.superview, at:.Bottom)
		return self
	}
 
	// 幅指定
	/*
	public func width(value:CGFloat? = nil) -> BYViewConstraint {
		return size(.H, value:value)
	}
	*/

	//objc用
	public func width() -> BYViewConstraint {
		return size(.H, value:nil)
	}
	public func width(value:CGFloat) -> BYViewConstraint {
		return size(.H, value:value)
	}

	// 高さ指定
	/*
	public func height(value:CGFloat? = nil) -> BYViewConstraint {
		return size(.V, value:value)
	}
	*/

	// objc用
	public func height() -> BYViewConstraint {
		return size(.V, value:nil)
	}
	public func height(value:CGFloat) -> BYViewConstraint {
		return size(.V, value:value)
	}

	public func size(axis:Axis, value:CGFloat?) -> BYViewConstraint {
		var size: CGFloat = 0
		if value == nil {
			size = (axis == .H ? self.target!.bounds.size.width : self.target!.bounds.size.height)
		}
		else {
			size = CGFloat(value!)
		}
		return complex(axis.size(), to:nil, at:.NotAnAttribute, metric:size)
	}

	private func asToView(toView:UIView?) -> UIView {
		if let view = toView {
			return view
		}
		return self.superview
	}
}
