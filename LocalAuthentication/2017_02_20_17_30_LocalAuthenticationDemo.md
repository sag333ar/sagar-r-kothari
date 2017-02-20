Insert following code snippet for local authentication.

```swift
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
```