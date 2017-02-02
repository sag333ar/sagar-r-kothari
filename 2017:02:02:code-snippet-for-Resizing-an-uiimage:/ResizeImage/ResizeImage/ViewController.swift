//
//  ViewController.swift
//  ResizeImage
//
//  Created by Sagar on 2/2/17.
//  Copyright © 2017 http://sagarrkothari.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var imgV: UIImageView!
	override func viewDidLoad() {
		super.viewDidLoad()
		let img = UIImage(named: "SagarRKothari")
		self.imgV.image = img?.resizeWith(width: 100)
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

extension UIImage {
	public func resizeWith(width: CGFloat) -> UIImage? {
		let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))))
		imageView.contentMode = .scaleAspectFit
		imageView.image = self
		UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
		guard let context = UIGraphicsGetCurrentContext() else { return nil }
		imageView.layer.render(in: context)
		guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
		UIGraphicsEndImageContext()
		return result
	}
}

