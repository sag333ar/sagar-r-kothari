//
//  ViewController.swift
//  PlayVideoInsideUIView
//
//  Created by Sagar on 2/2/17.
//  Copyright © 2017 http://sagarrkothari.com. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

	@IBOutlet weak var imgV: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.playVideo()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func playVideo() {
		if let moviePath = Bundle.main.path(forResource: "SagarRKothari", ofType: "mov") {
			let movieURL = URL(fileURLWithPath: moviePath)
			let player = AVPlayer(url: movieURL)
			let playerLayer = AVPlayerLayer()
			playerLayer.player = player
			playerLayer.frame = self.imgV.bounds
			playerLayer.backgroundColor = UIColor.clear.cgColor
			playerLayer.videoGravity = AVLayerVideoGravityResizeAspect
			self.imgV.layer.addSublayer(playerLayer)
			player.play()
		}
	}

}

