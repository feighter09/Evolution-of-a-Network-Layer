//
//  ViewControllerTests.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 8/10/16.
//  Copyright (c) 2016 Lost in Flight. All rights reserved.
//

@testable import NetworkingEvolution
import PromiseKit
import SwiftyJSON
import XCTest

class ViewControllerTests: XCTestCase {
  var viewController: ViewController!
  
  override func setUp()
  {
    super.setUp()
    viewController = ViewController()
  }
}

// MARK: Tests
extension ViewControllerTests {
  func test_successNetworkResponse_showsUsername()
  {
    viewController.fetchUser = MockSuccessFetchUser()
    viewController.loadViewIfNeeded()
    
    let expectation = expectationWithDescription("Label set")
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10), dispatch_get_main_queue()) {
      XCTAssertEqual(self.viewController.label.text, "Username: feighter09")
      expectation.fulfill()
    }
    
    waitForExpectationsWithTimeout(0.0001, handler: nil)
  }
  
  func test_failureNetworkResponse_showsErrorMessage()
  {
    viewController.fetchUser = MockFailureFetchUser()
    viewController.loadViewIfNeeded()
    
    let expectation = expectationWithDescription("Label set")
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10), dispatch_get_main_queue()) { 
      XCTAssertEqual(self.viewController.label.text, "Request failed")
      expectation.fulfill()
    }
    
    waitForExpectationsWithTimeout(0.0001, handler: nil)
  }
}

// MARK: - Mocks
private class MockSuccessFetchUser: FetchUser {
  override func perform(username: String) -> Promise<User>
  {
    return Promise(User(name: username))
  }
}

private class MockFailureFetchUser: FetchUser {
  override func perform(username: String) -> Promise<User>
  {
    return Promise(error: NSError(domain: "", code: -1, userInfo: nil))
  }
}