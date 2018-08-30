//
//  UIImageExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 06/04/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

import UIKit

public extension UIImage {

	/**
	Create a new masked image with a defined color from the current image.
	
	- parameters:
	 - color: The color to use to mask the current image.
	 - opaque: A `Boolean` flag indicating whether the bitmap is opaque. If you know the bitmap is fully opaque, specify true to ignore the alpha channel and optimize the bitmap’s storage. Specifying false means that the bitmap must include an alpha channel to handle any partially transparent pixels.
	- returns: A color-masked version of the current `UIImage` instance painted with the given color.
	*/
	func mask(withColor color: UIColor, isOpaque opaque: Bool = false) -> UIImage? {
		UIGraphicsBeginImageContextWithOptions(size, opaque, UIScreen.main.scale)
		
		guard
			let context = UIGraphicsGetCurrentContext(),
			let image = cgImage
		else {
			return nil
		}
		
		let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
		
		color.setFill()
		
		context.translateBy(x: 0, y: size.height)
		context.scaleBy(x: 1.0, y: -1.0)
		context.setBlendMode(.colorBurn)
		context.draw(image, in: frame)
		context.setBlendMode(.sourceIn)
		context.addRect(frame)
		context.drawPath(using: .fill)
		
		let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
		
		UIGraphicsEndImageContext()
		
		return coloredImage
	}

}
