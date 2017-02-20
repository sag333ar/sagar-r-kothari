//
//  ViewController.swift
//  LocalAuthenticationDemo
//
//  Created by Sagar on 2/20/17.
//  Copyright © 2017 http://sagarrkothari.com. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func buttonTapped(_ sender: AnyObject) {
		self.userAuthenticationRequired()
	}

	// MARK: Touch ID
	func userAuthenticationRequired() {
		let context: LAContext = LAContext()
		
		// Reference the error codes listed in the tutorial
		var error: NSError?
		
		// What the customer will see in the alert view
		let description = "Authenticate To Access this application."
		if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
			context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: description, reply: { (success, error) -> Void in
				
				if success {
					self.success()
				} else {
					print("Something went wrong! \(error?.localizedDescription)")
					// Observe the error code to see what went wrong &amp; guide the user to the
					// appropriate area. For now we assume cancelation and let them proceed
					// with entering a code.
				}
			})
		}
		
		if error != nil {
			print("Something went wrong! \(error?.localizedDescription)")
		}
	}

	func success() {
		
	}
}

