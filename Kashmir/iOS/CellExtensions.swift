//
//  CellExtensions.swift
//  Kashmir_iOS
//
//  Created by Javier Cicchelli on 19/01/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import UIKit

public extension Cell where Self: UITableViewCell {
	
	// MARK: Static
	
	/**
	Registers a nib object containing the cell into a table.
	
	- parameter tableView: A table view in which to register the nib object.
	*/
	static func registerNib(in tableView: UITableView) {
		let bundle = Bundle(for: self)
		let nib = UINib(nibName: nibName,
						bundle: bundle)
		
		tableView.register(nib,
						   forCellReuseIdentifier: reuseIdentifier)
	}
	
	/**
	Returns a reusable table view cell object dequeued from a specified index in a table view.
	
	- parameters:
	  - tableView: A table view from where to dequeue the reusable cell.
	  - indexPath: The index path specifying the location of the cell.
	- throws: A `CellError` error is thrown during the dequeuing of the cell.
	- returns: A dequeued table view cell object.
	*/
	static func dequeue(from tableView: UITableView,
						for indexPath: IndexPath) throws -> Self {
		guard
			let dequededCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
															 for: indexPath) as? Self
		else {
			throw CellError.dequeueFailed
		}
		
		return dequededCell
	}
	
}
