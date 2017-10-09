//
//  ViewControllerTableViewDelegate.swift
//  nToDo
//
//  Created by sagar kothari on 07/10/17.
//  Copyright © 2017 Sagar R. Kothari. All rights reserved.
//

import UIKit

class ViewControllerTableViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {

  var tasks: [Task] = []

  override init() {
    super.init()
    loadData()
  }

  func loadData() {
    do {
      tasks = try context.fetch(Task.fetchRequest())
    } catch {
      tasks = []
    }
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let label = cell.viewWithTag(1) as? UILabel
    if let title = tasks[indexPath.row].title {
      label?.text = title
    } else {
      label?.text = ""
    }
//    if let date = tasks[indexPath.row].due {
//      let df = DateFormatter()
//      df.dateFormat = "dd-MMM-yyyy"
//      cell.detailTextLabel?.text = "Due on \(df.string(from: date))"
//    } else {
//      cell.detailTextLabel?.text = ""
//    }
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

}

extension ViewControllerTableViewDelegate {


}
