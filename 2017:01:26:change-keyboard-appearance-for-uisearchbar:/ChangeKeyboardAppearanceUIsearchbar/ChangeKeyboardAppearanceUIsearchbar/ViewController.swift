//
//  ViewController.swift
//  ChangeKeyboardAppearanceUIsearchbar
//
//  Created by Sagar on 1/26/17.
//  Copyright © 2017 http://sagarrkothari.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var searchBar: UISearchBar!

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

}

extension ViewController: UISearchBarDelegate {

	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		ViewController.changeSearchBarKeyboardColor(searchBar)
	}

	public class func changeSearchBarKeyboardColor(_ searchBar: UISearchBar) {
		for subview in searchBar.subviews {
			for innerView in subview.subviews {
				if let _ = innerView as? UITextInputTraits,
					let textField = innerView as? UITextField {
					textField.keyboardAppearance = .alert
				}
			}
		}
	}
}
