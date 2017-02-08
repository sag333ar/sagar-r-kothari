//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Sagar on 2/8/17.
//  Copyright © 2017 http://sagarrkothari.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		appDel.addOffice("Sagar")
		appDel.addOffice("Kothari")
		appDel.addOffice("Pune")
		appDel.addOffice("Mumbai")
		let array = appDel.getOffices()
		for office in array {
			print("Office name is \(office.name!)")
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

