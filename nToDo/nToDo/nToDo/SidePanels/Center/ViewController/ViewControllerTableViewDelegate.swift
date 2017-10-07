//
//  ViewControllerTableViewDelegate.swift
//  nToDo
//
//  Created by sagar kothari on 07/10/17.
//  Copyright © 2017 Sagar R. Kothari. All rights reserved.
//

import UIKit

class ViewControllerTableViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {

  var locations: [Location] = []
  var tags: [Tag] = []
  var lists: [List] = []
  var tasks: [Task] = []

  override init() {
    super.init()
    loadData()
  }

  func loadData() {
    do {
      locations = try context.fetch(Location.fetchRequest())
    } catch {
      locations = []
    }
    do {
      lists = try context.fetch(List.fetchRequest())
    } catch {
      lists = []
    }
    do {
      tags = try context.fetch(Tag.fetchRequest())
    } catch {
      tags = []
    }
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
    return self.tasks.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    if let title = self.tasks[indexPath.row].title {
      cell.textLabel?.text = title
    } else {
      cell.textLabel?.text = ""
    }
    if let date = self.tasks[indexPath.row].due {
      let df = DateFormatter()
      df.dateFormat = "dd-MMM-yyyy"
      cell.detailTextLabel?.text = "Due on \(df.string(from: date))"
    } else {
      cell.detailTextLabel?.text = ""
    }
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

}
