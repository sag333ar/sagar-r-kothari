//
//  ViewController.swift
//  nToDo
//
//  Created by Kothari, Sagar on 8/17/17.
//  Copyright © 2017 Sagar R. Kothari. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var textFieldAddTask: SkyFloatingLabelTextField!
  @IBOutlet weak var tableViewDelegate: ViewControllerTableViewDelegate!

  @IBOutlet weak var layoutConstraintListBottom: NSLayoutConstraint!
  override func viewDidLoad() {
    super.viewDidLoad()
    // ↑ ↓
    let tapG = UITapGestureRecognizer(target: self,
                                      action: #selector(ViewController.navigationItemTapped))
    self.navigationController?.navigationBar.addGestureRecognizer(tapG)
//    storeData()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    collapseListView()
  }

  @objc func navigationItemTapped() {
    if layoutConstraintListBottom.constant < 0 {
      expandListView()
    } else {
      collapseListView()
    }
  }

  func expandListView() {
    title = "↑ Inbox"
    layoutConstraintListBottom.constant = 0
    animateListView()
  }

  func collapseListView() {
    title = "↓ Inbox"
    layoutConstraintListBottom.constant =
      (tableView.frame.size.height + tableView.frame.origin.y) * -1
    animateListView()
  }

  func animateListView() {
    view.setNeedsUpdateConstraints()
    UIView.animate(withDuration: 0.25, animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

extension ViewController {

  func getTomorrowDate() -> Date {
    let cal = NSCalendar.current
    let now = Date()
    let compSet = Set(arrayLiteral:Calendar.Component.day,
                      Calendar.Component.month,
                      Calendar.Component.year)
    var comp = cal.dateComponents(compSet as Set<Calendar.Component>, from: now)
    comp.timeZone = TimeZone.current
    comp.day = comp.day! + 1
    return cal.date(from: comp)!
  }

  func storeData() {
    let location1 = Location(context: context)
    location1.title = "Brahma Suncity"
    let location2 = Location(context: context)
    location2.title = "Viman Nagar"
    let location3 = Location(context: context)
    location3.title = "Pimpri Chinchwad"
    let location4 = Location(context: context)
    location4.title = "Lunkad Gardens"
    let location5 = Location(context: context)
    location5.title = "Durshet, Maharashtra"
    let location6 = Location(context: context)
    location6.title = "Swati Greens"
    let location7 = Location(context: context)
    location7.title = "Shukan Homes"

    let tag1 = Tag(context: context)
    tag1.title = "Important"
    let tag2 = Tag(context: context)
    tag2.title = "Dreams"
    let tag3 = Tag(context: context)
    tag3.title = "Ideas"
    let tag4 = Tag(context: context)
    tag4.title = "Budget"
    let tag5 = Tag(context: context)
    tag5.title = "Expenses"

    let list1 = List(context: context)
    list1.title = "Inbox"

    let task1 = Task(context: context)
    task1.title = "Remember the milk"
    task1.priority = 1
    task1.estimate = 1
    task1.start = Date()
    task1.due = getTomorrowDate()
    task1.locations = location1
    task1.list = list1
    task1.tags = NSSet(arrayLiteral: tag1, tag2)
    task1.completed = false
    appDel.saveContext()

  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}

/**
    let location1 = Location(context: context)
    location1.title = "Brahma Suncity"
    let location2 = Location(context: context)
    location2.title = "Viman Nagar"
    let location3 = Location(context: context)
    location3.title = "Pimpri Chinchwad"
    let location4 = Location(context: context)
    location4.title = "Lunkad Gardens"
    let location5 = Location(context: context)
    location5.title = "Durshet, Maharashtra"
    let location6 = Location(context: context)
    location6.title = "Swati Greens"
    let location7 = Location(context: context)
    location7.title = "Shukan Homes"

    let tag1 = Tag(context: context)
    tag1.title = "Important"
    let tag2 = Tag(context: context)
    tag2.title = "Dreams"
    let tag3 = Tag(context: context)
    tag3.title = "Ideas"
    let tag4 = Tag(context: context)
    tag4.title = "Budget"
    let tag5 = Tag(context: context)
    tag5.title = "Expenses"

    let list1 = List(context: context)
    list1.title = "Inbox"

    AppDel.saveContext()

     let task1 = Task(context: context)
     task1.title = "Remember the milk"
     task1.priority = 1
     task1.estimate = 1
     task1.start = Date()
     task1.due = getTomorrowDate()
     task1.locations = locations[0]
     task1.list = lists[0]
     task1.tags = NSSet(arrayLiteral: tags[0], tags[1])
*/
/*
    do {
      locations = try context.fetch(Location.fetchRequest())
    } catch {
      locations = []
    }
*/
