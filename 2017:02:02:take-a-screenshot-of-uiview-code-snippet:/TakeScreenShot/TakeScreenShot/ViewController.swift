//
//  ViewController.swift
//  TakeScreenShot
//
//  Created by Sagar on 2/2/17.
//  Copyright © 2017 http://sagarrkothari.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var imgV: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	@IBAction func btnScreenShotTapped(_ sender: Any) {
		self.imgV.image = self.view.screenShot
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

extension UIView {

	var screenShot: UIImage? {
		UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
		layer.render(in: UIGraphicsGetCurrentContext()!)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image
	}

}
