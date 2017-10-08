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
  @IBOutlet weak var tableViewDelegate: ViewControllerTableViewDelegate!
  weak var listViewController: ListViewController!
  var titleButton: UIButton?
  var isExpanded: Bool = false {
    didSet {
      updateTitle()
    }
  }
  var titleForButton: String = "All Tasks" {
    didSet {
      updateTitle()
    }
  }

  @IBOutlet weak var layoutConstraintListBottom: NSLayoutConstraint!
  override func viewDidLoad() {
    super.viewDidLoad()
//    storeData()
//    let list1 = List(context: context)
//    list1.title = "HomeToDos"
//    let list2 = List(context: context)
//    list2.title = "Viman Nagar"
//    let list3 = List(context: context)
//    list3.title = "Movies to watch"
//    appDel.saveContext()
    addTitleView()
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
    isExpanded = true
    layoutConstraintListBottom.constant = 0
    animateListView()
  }

  func collapseListView() {
    isExpanded = false
    layoutConstraintListBottom.constant =
      (tableView.frame.size.height + tableView.frame.origin.y + 44 ) * -1
    animateListView()
  }

  func animateListView() {
    view.setNeedsUpdateConstraints()
    UIView.animate(withDuration: 0.25, animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }

  func addTitleView() {
    let rect = CGRect(x: 0, y: 0, width: 200, height: 40)
    titleButton = UIButton(frame: rect)
    titleButton?.setTitleColor(navigationController?.navigationBar.tintColor,
                               for: .normal)
    titleButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    titleButton?.backgroundColor = UIColor.clear
    titleButton?.titleLabel?.adjustsFontSizeToFitWidth = true
    titleButton?.titleLabel?.textAlignment = .center
    titleButton?.addTarget(self,
                           action: #selector(ViewController.navigationItemTapped),
                           for: .touchUpInside)
    self.navigationItem.titleView = titleButton
  }

  func updateTitle() {
    let arrow = isExpanded ? "↑" : "↓"
    titleButton?.setTitle("\(arrow) \(titleForButton)", for: .normal)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "listview", let listview = segue.destination as? ListViewController {
      listViewController = listview
      listViewController.viewController = self
    }
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
