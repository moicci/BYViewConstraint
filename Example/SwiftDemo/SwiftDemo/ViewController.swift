//
//  ViewController.swift
//  SwiftDemo
//
//  Created by fukuda on 2015/03/17.
//  Copyright (c) 2015年 bylo media inc. All rights reserved.
//

import UIKit
import BYViewConstraint

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		setupLayout()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	private func setupLayout() {
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
	}
	
	private func addLabel(text:String, backColor:UIColor, textColor:UIColor = UIColor.whiteColor()) -> UILabel {
		let label = UILabel(frame:self.view.bounds)
		label.text = text
		label.textColor = textColor
		label.backgroundColor = backColor
		label.textAlignment = .Center
		self.view.addSubview(label)
		return label
	}
	
}
