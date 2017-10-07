//
//  nToDoUITests.swift
//  nToDoUITests
//
//  Created by Kothari, Sagar on 8/17/17.
//  Copyright © 2017 Sagar R. Kothari. All rights reserved.
//

import XCTest

class NToDoUITests: XCTestCase {

  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    XCUIApplication().launch()
  }

  override func tearDown() {
    super.tearDown()
  }

}
