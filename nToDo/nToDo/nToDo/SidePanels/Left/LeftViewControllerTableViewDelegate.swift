//
//  LeftViewControllerTableViewDelegate.swift
//  nToDo
//
//  Created by sagar kothari on 09/10/17.
//  Copyright © 2017 Sagar R. Kothari. All rights reserved.
//

import UIKit

class LeftViewControllerTableViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {

  let section1 = [("Home", UIImage(named: "TabBarHome")!),
                  ("Lists", UIImage(named: "TabBarList")!),
                  ("Tags", UIImage(named: "TabBarTag")!),
                  ("Locations", UIImage(named: "TabBarLocation")!)]
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section1.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = section1[indexPath.row].0
    cell.imageView?.image = section1[indexPath.row].1
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

}
