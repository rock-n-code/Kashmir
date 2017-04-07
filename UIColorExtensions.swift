//
//  UIColorExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 07/04/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import UIKit

public extension UIColor {

	// MARK: Initializers
	
	/**
	Initializes and returns a color object using the specified opacity and RGB hexadecimal value.
	
	- parameters:
	  - rgb: The RGB value of the color object, specified as a hexadecimal value from 0x000000 to 0xFFFFFF.
	  - alpha: The opacity value of the color object, specified as a value from 0.0 to 1.0.
	- note: Alpha values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
	*/
	convenience init(rgbCode: UInt, alpha: CGFloat = 1.0) {
		self.init(red: CGFloat((rgbCode & 0xFF0000) >> 16) / 255.0,
		          green: CGFloat((rgbCode & 0x00FF00) >> 8) / 255.0,
		          blue: CGFloat(rgbCode & 0x0000FF) / 255.0,
		          alpha: alpha)
	}
	
	/**
	Initializes and returns a color object using the specified opacity and RGB component numbers.
	
	- parameters:
	  - numberRed: The red value of the color object, specified as a value from 0 to 255.
	  - numberGreen: The green value of the color object, specified as a value from 0 to 255.
	  - numberBlue: The blue value of the color object, specified as a value from 0 to 255.
	  - alpha: The opacity value of the color object, specified as a value from 0.0 to 1.0.
	- note: All red, green and blue values below 0 are interpreted as 0, and values above 255 are interpreted as 255. For alpha values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
	*/
	convenience init(redNumber: Int, greenNumber: Int, blueNumber: Int, alpha: CGFloat = 1.0) {
		let numbers = [redNumber, greenNumber, blueNumber].map { number -> Int in
			if number < 0 {
				return 0
			}
			else if number > 255 {
				return 255
			}
			else {
				return number
			}
		}

		self.init(red: CGFloat(numbers[0]) / 255.0,
		          green: CGFloat(numbers[1]) / 255.0,
		          blue: CGFloat(numbers[2]) / 255.0,
		          alpha: alpha)
	}
	
	// MARK: Static

	/**
	Generates and return a random color object using the specified opacity.
	
	- parameter alpha: The opacity value of the color object, specified as a value from 0.0 to 1.0.
	- returns: The random color object. The color information represented by this object is in an RGB colorspace.
	- note: Alpha values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
	*/
	public static func makeRandom(withAlpha alpha: CGFloat = 1.0) -> UIColor {
		return UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0,
		               green: CGFloat(arc4random_uniform(255)) / 255.0,
		               blue: CGFloat(arc4random_uniform(255)) / 255.0,
		               alpha: alpha)
	}
	
}
