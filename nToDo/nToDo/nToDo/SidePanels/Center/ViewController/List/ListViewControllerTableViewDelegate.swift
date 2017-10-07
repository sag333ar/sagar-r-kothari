//
//  ListViewControllerTableViewDelegate.swift
//  nToDo
//
//  Created by sagar kothari on 07/10/17.
//  Copyright © 2017 Sagar R. Kothari. All rights reserved.
//

import UIKit

class ListViewControllerTableViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {

  var lists: [List] = []

  override init() {
    super.init()
    loadData()
  }

  func loadData() {
    do {
      lists = try context.fetch(List.fetchRequest())
    } catch {
      lists = []
    }
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.lists.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    if let title = self.lists[indexPath.row].title {
      cell.textLabel?.text = title
    } else {
      cell.textLabel?.text = ""
    }
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

}
