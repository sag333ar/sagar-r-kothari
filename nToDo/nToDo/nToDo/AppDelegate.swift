//
//  AppDelegate.swift
//  nToDo
//
//  Created by Kothari, Sagar on 8/17/17.
//  Copyright © 2017 Sagar R. Kothari. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import CoreData
import JASidePanels

let appDel = (UIApplication.shared.delegate as? AppDelegate)!
let context = appDel.persistentContainer.viewContext

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var sidePanel: JASidePanelController?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions
    launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    Fabric.with([Crashlytics.self])

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let leftPanel = storyboard.instantiateViewController(withIdentifier: "LeftViewControllerID")
    let centerPanel = storyboard.instantiateViewController(withIdentifier: "NavigationControllerID")
    sidePanel = JASidePanelController()
    sidePanel?.leftPanel = leftPanel
    sidePanel?.centerPanel = centerPanel
    sidePanel?.allowLeftSwipe = false
    sidePanel?.allowRightSwipe = false
    window?.rootViewController = sidePanel

    // Override point for customization after application launch.
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {

  }

  func applicationDidEnterBackground(_ application: UIApplication) {

  }

  func applicationWillEnterForeground(_ application: UIApplication) {

  }

  func applicationDidBecomeActive(_ application: UIApplication) {

  }

  func applicationWillTerminate(_ application: UIApplication) {
    self.saveContext()
  }

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "nToDo")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {

        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  // MARK: - Core Data Saving support
  func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }

}
