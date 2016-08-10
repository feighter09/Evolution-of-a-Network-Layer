//
//  ViewControllerTests.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 8/10/16.
//  Copyright (c) 2016 Lost in Flight. All rights reserved.
//

@testable import NetworkingEvolution
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
    XCTAssertEqual(viewController.label.text, "Username: feighter09")
  }
  
  func test_failureNetworkResponse_showsErrorMessage()
  {
    viewController.fetchUser = MockFailureFetchUser()
    viewController.loadViewIfNeeded()
    XCTAssertEqual(viewController.label.text, "Request failed")
  }
}

// MARK: - Mocks
private class MockSuccessFetchUser: FetchUser {
  override func perform(username: String, callback: (User?, ErrorType?) -> Void)
  {
    callback(User(name: username), nil)
  }
}

private class MockFailureFetchUser: FetchUser {
  override func perform(username: String, callback: (User?, ErrorType?) -> Void)
  {
    callback(nil, NSError(domain: "", code: -1, userInfo: nil))
  }
}