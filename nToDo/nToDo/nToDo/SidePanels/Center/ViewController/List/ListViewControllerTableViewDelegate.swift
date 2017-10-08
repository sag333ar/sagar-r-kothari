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
  var selectedList: List?
  weak var listViewController: ListViewController?

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
    return self.lists.count + 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let label = cell.viewWithTag(1) as? UILabel
    let checkmark = cell.viewWithTag(2) as? UIImageView
    if indexPath.row == 0 {
      label?.text = "All Tasks"
      checkmark?.isHidden = selectedList != nil
    } else {
      if let title = lists[indexPath.row-1].title {
        label?.text = title
      } else {
        label?.text = ""
      }
      checkmark?.isHidden = selectedList != nil ? lists[indexPath.row-1] != selectedList : true
    }
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if indexPath.row == 0 {
      selectedList = nil
    } else {
      selectedList = lists[indexPath.row-1]
    }
    
    if let list = selectedList {
      if let tasks = list.tasks?.allObjects as? [Task] {
        listViewController?.viewController?.tableViewDelegate.tasks = tasks
      } else {
        listViewController?.viewController?.tableViewDelegate.tasks = []
      }
      listViewController?.viewController?.titleForButton = list.title!
    } else {
      listViewController?.viewController?.tableViewDelegate.loadData()
      listViewController?.viewController?.titleForButton = "All Tasks"
    }
    listViewController?.viewController?.tableView.reloadData()
    tableView.reloadData()
  }

}
