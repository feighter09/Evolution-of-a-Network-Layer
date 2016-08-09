//
//  UsernameRequest.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 8/9/16.
//  Copyright © 2016 Lost in Flight. All rights reserved.
//

import Alamofire
import PromiseKit

protocol UserRequestType: NetworkRequest {
  associatedtype ResponseType = User
  func perform(username: String) -> Promise<User>
}

class UserRequest: UserRequestType {
  typealias ResponseType = User
  
  var endpoint: String = ""
  var method: Alamofire.Method = .POST
  
  var username: String = ""
  var params: [String : AnyObject] { return ["param": username] }
  
  func perform(username: String) -> Promise<User>
  {
    self.username = username
    
    return networkClient.performRequest(self)
                        .then(responseHandler)
  }
}