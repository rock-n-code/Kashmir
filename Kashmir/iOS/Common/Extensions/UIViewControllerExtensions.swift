//
//  UIViewControllerExtensions.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 19/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import UIKit

extension UIViewController {
	
	// MARK: Functions
	
	/**
	Adds a child view controller to a view controller and displays it into a specific view.
	
	- parameters:
	   - viewController: A view controller to add as a child view controller.
	   - view: A view in which to visualize the content of the view controller added as a child view controller.
	*/
	func addChild(viewController: UIViewController,
				  to view: UIView) {
		addChildViewController(viewController)
		
		viewController.willMove(toParentViewController: self)
		
		viewController.view.frame = CGRect(origin: .zero,
										   size: view.frame.size)
		
		view.addSubview(viewController.view)
		
		viewController.didMove(toParentViewController: self)
	}
	
	/**
	Removes a child view controller from a view controller and removes it from a specific view.
	
	- parameters:
	   - viewController: A view controller to remove as a child view controller.
	   - view: A view in which to remove the content of the ousted view controller.
	*/
	func removeChild(viewController: UIViewController,
					 from view: UIView) {
		viewController.willMove(toParentViewController: nil)
		viewController.removeFromParentViewController()
		viewController.view.removeFromSuperview()
		viewController.didMove(toParentViewController: nil)
	}
	
}
