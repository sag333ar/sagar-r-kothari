//
//  ListViewController.swift
//  nToDo
//
//  Created by sagar kothari on 07/10/17.
//  Copyright © 2017 Sagar R. Kothari. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var tableViewDelegate: ListViewControllerTableViewDelegate!
  weak var viewController: ViewController?

  override func viewDidLoad() {
    super.viewDidLoad()
    tableViewDelegate.listViewController = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}
