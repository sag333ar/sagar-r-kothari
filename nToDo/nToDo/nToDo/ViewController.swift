//
//  ViewController.swift
//  nToDo
//
//  Created by Kothari, Sagar on 8/17/17.
//  Copyright © 2017 Sagar R. Kothari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var locations: [Location] = []
  var tags: [Tag] = []
  var lists: [List] = []
  var tasks: [Task] = []

  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
//    storeData()
    loadData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func loadData() {
    do {
      locations = try Context.fetch(Location.fetchRequest())
    } catch {
      locations = []
    }
    do {
      lists = try Context.fetch(List.fetchRequest())
    } catch {
      lists = []
    }
    do {
      tags = try Context.fetch(Tag.fetchRequest())
    } catch {
      tags = []
    }
    do {
      tasks = try Context.fetch(Task.fetchRequest())
    } catch {
      tasks = []
    }
    tableView.reloadData()
  }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

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
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

}

extension ViewController {

  func getTomorrowDate() -> Date {
    let cal = NSCalendar.current
    let now = Date()
    let compSet = Set(arrayLiteral: Calendar.Component.day, Calendar.Component.month, Calendar.Component.year)
    var comp = cal.dateComponents(compSet as Set<Calendar.Component>, from: now)
    comp.timeZone = TimeZone.current
    comp.day = comp.day! + 1
    return cal.date(from: comp)!
  }

  func storeData() {
    let location1 = Location(context: Context)
    location1.title = "Brahma Suncity"
    let location2 = Location(context: Context)
    location2.title = "Viman Nagar"
    let location3 = Location(context: Context)
    location3.title = "Pimpri Chinchwad"
    let location4 = Location(context: Context)
    location4.title = "Lunkad Gardens"
    let location5 = Location(context: Context)
    location5.title = "Durshet, Maharashtra"
    let location6 = Location(context: Context)
    location6.title = "Swati Greens"
    let location7 = Location(context: Context)
    location7.title = "Shukan Homes"
    
    let tag1 = Tag(context: Context)
    tag1.title = "Important"
    let tag2 = Tag(context: Context)
    tag2.title = "Dreams"
    let tag3 = Tag(context: Context)
    tag3.title = "Ideas"
    let tag4 = Tag(context: Context)
    tag4.title = "Budget"
    let tag5 = Tag(context: Context)
    tag5.title = "Expenses"
    
    let list1 = List(context: Context)
    list1.title = "Inbox"
    
    AppDel.saveContext()
    loadData()
    
    let task1 = Task(context: Context)
    task1.title = "Remember the milk"
    task1.priority = 1
    task1.estimate = 1
    task1.start = Date()
    task1.due = getTomorrowDate()
    task1.locations = locations[0]
    task1.list = lists[0]
    task1.tags = NSSet(arrayLiteral: tags[0], tags[1])
    task1.completed = false
    AppDel.saveContext()
    loadData()
  }
}

/*
    let location1 = Location(context: Context)
    location1.title = "Brahma Suncity"
    let location2 = Location(context: Context)
    location2.title = "Viman Nagar"
    let location3 = Location(context: Context)
    location3.title = "Pimpri Chinchwad"
    let location4 = Location(context: Context)
    location4.title = "Lunkad Gardens"
    let location5 = Location(context: Context)
    location5.title = "Durshet, Maharashtra"
    let location6 = Location(context: Context)
    location6.title = "Swati Greens"
    let location7 = Location(context: Context)
    location7.title = "Shukan Homes"
 
    let tag1 = Tag(context: Context)
    tag1.title = "Important"
    let tag2 = Tag(context: Context)
    tag2.title = "Dreams"
    let tag3 = Tag(context: Context)
    tag3.title = "Ideas"
    let tag4 = Tag(context: Context)
    tag4.title = "Budget"
    let tag5 = Tag(context: Context)
    tag5.title = "Expenses"
 
    let list1 = List(context: Context)
    list1.title = "Inbox"
 
    AppDel.saveContext()
 
     let task1 = Task(context: Context)
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
      locations = try Context.fetch(Location.fetchRequest())
    } catch {
      locations = []
    }
*/
