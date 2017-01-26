//
//  ViewController.swift
//  ShowPopover
//
//  Created by Sagar on 1/26/17.
//  Copyright © 2017 http://sagarrkothari.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var btn: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func btnTapped(_ sender: AnyObject) {
		self.performSegue(withIdentifier: "from_home_to_popover", sender: nil)
	}

}

extension ViewController: UIPopoverPresentationControllerDelegate {
	func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
		return UIModalPresentationStyle.none
	}
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "from_home_to_popover" {
			if let vctr = segue.destination as? MyPopOverViewController {
				vctr.modalPresentationStyle = .popover
				vctr.popoverPresentationController?.delegate = self
				vctr.popoverPresentationController?.sourceView = self.view
				vctr.popoverPresentationController?.sourceRect = self.btn.frame
			}
		}
	}
}

class MyPopOverViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		self.preferredContentSize = CGSize(width: 200, height: 200)
	}
}
