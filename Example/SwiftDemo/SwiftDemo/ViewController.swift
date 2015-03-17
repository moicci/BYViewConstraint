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
