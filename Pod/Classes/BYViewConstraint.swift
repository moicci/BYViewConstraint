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
	private var views:[String:UIView]! = nil
	private var metrics:[String:Int]! = nil
	private var constraints:[AnyObject] = []
	
	public init(superview:UIView) {
		self.superview = superview
	}

	public func view(name:String, view:UIView) -> BYViewConstraint {
		prepareView(view)

		if self.views == nil {
			self.views = Dictionary()
		}
		self.views[name] = view
		return self
	}

	public func metric(name:String, value:Int) -> BYViewConstraint {
		if self.metrics == nil {
			self.metrics = Dictionary()
		}
		self.metrics[name] = value
		return self
	}

	public func format(format:String) -> BYViewConstraint {
		let array = NSLayoutConstraint.constraintsWithVisualFormat(format,
						//options:NSLayoutFormatOptions(0),
						options:NSLayoutFormatOptions.allZeros,
						metrics:self.metrics,
						views:self.views)
		self.constraints += array
		return self
	}

	// ややこしいやつはこれ
	public func complex(view:UIView, at:NSLayoutAttribute, to toView:UIView!, at toAt:NSLayoutAttribute, metric:CGFloat = 0) -> BYViewConstraint {
		prepareView(view)
		self.constraints.append(NSLayoutConstraint(
                item: view,
                attribute: at,
                relatedBy: .Equal,
                toItem: toView,
                attribute: toAt,
                multiplier: 1.0,
                constant: metric
            ))
		return self;
	}

	// 中央指定の VisualFormat は "H:|-[view]-|" で行けるかと思ったらエラーになるので
	// 専用メソッドにした。
	// @param axis .CenterX, .CenterY
	public func centerX(view:UIView) -> BYViewConstraint {
		return center(view, axis:.H)
	}
	public func centerY(view:UIView) -> BYViewConstraint {
		return center(view, axis:.V)
	}

	private func asToView(toView:UIView?) -> UIView {
		if let view = toView {
			return view
		}
		return self.superview
	}

	public func center(view:UIView, axis:Axis) -> BYViewConstraint {
		return complex(view, at:axis.center(), to:self.superview, at:axis.center())
	}

	// view の左を attachTo の右に揃える
	public func left(view:UIView, attachTo:UIView, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(view, at:.Left, to:attachTo, at:.Right, metric:offset)
	}
	public func right(view:UIView, attachTo:UIView, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(view, at:.Right, to:attachTo, at:.Left, metric:offset)
	}
	public func top(view:UIView, attachTo:UIView, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(view, at:.Top, to:attachTo, at:.Bottom, metric:offset)
	}
	public func bottom(view:UIView, attachTo:UIView, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(view, at:.Bottom, to:attachTo, at:.Top, metric:offset)
	}

	// view の左を alignTo の左に揃える
	public func left(view:UIView, alignTo:UIView? = nil, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(view, at:.Left, to:asToView(alignTo), at:.Left, metric:offset)
	}
	public func right(view:UIView, alignTo:UIView? = nil, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(view, at:.Right, to:asToView(alignTo), at:.Right, metric:offset)
	}
	public func top(view:UIView, alignTo:UIView? = nil, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(view, at:.Top, to:asToView(alignTo), at:.Top, metric:offset)
	}
	public func bottom(view:UIView, alignTo:UIView? = nil, offset:CGFloat = 0) -> BYViewConstraint {
		return complex(view, at:.Bottom, to:asToView(alignTo), at:.Bottom, metric:offset)
	}

	// 横いっぱい
	public func fullWidth(view:UIView) -> BYViewConstraint {
		complex(view, at:.Left, to:self.superview, at:.Left)
		complex(view, at:.Right, to:self.superview, at:.Right)
		return self
	}
	// 縦いっぱい
	public func fullHeight(view:UIView) -> BYViewConstraint {
		complex(view, at:.Top, to:self.superview, at:.Top)
		complex(view, at:.Bottom, to:self.superview, at:.Bottom)
		return self
	}
 
	// 横いっぱい
	public func fullWidthNamed(viewName:String) -> BYViewConstraint {
		return format("H:|-0-[\(viewName)]-0-|")
	}
 
	// 縦いっぱい
	public func fullHeightNamed(viewName:String) -> BYViewConstraint {
		return format("V:|-0-[\(viewName)]-0-|")
	}

	// 幅指定
	/*
	public func width(view:UIView, value:CGFloat? = nil) -> BYViewConstraint {
		return size(view, axis:.H, value:value)
	}
	*/

	//objc用
	public func width(view:UIView) -> BYViewConstraint {
		return size(view, axis:.H, value:nil)
	}
	public func width(view:UIView, value:CGFloat) -> BYViewConstraint {
		return size(view, axis:.H, value:value)
	}

	// 高さ指定
	/*
	public func height(view:UIView, value:CGFloat? = nil) -> BYViewConstraint {
		return size(view, axis:.V, value:value)
	}
	*/

	// objc用
	public func height(view:UIView) -> BYViewConstraint {
		return size(view, axis:.V, value:nil)
	}
	public func height(view:UIView, value:CGFloat) -> BYViewConstraint {
		return size(view, axis:.V, value:value)
	}

	public func size(view:UIView, axis:Axis, value:CGFloat?) -> BYViewConstraint {
		var size: CGFloat = 0
		if value == nil {
			size = (axis == .H ? view.bounds.size.width : view.bounds.size.height)
		}
		else {
			size = CGFloat(value!)
		}
		return complex(view, at:axis.size(), to:nil, at:.NotAnAttribute, metric:size)
	}

	public func apply() -> BYViewConstraint {
		self.superview.addConstraints(self.constraints)
		return self
	}

	public func clear() -> BYViewConstraint {
		self.views = nil
		self.metrics = nil
		self.superview.removeConstraints(self.constraints)
		self.constraints = []
		return self
	}

	private func prepareView(view:UIView) -> UIView {
		view.setTranslatesAutoresizingMaskIntoConstraints(false)
		return view
	}
}
