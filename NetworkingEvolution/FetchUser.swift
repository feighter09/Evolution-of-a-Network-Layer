//
//  FetchUser.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 8/10/16.
//  Copyright © 2016 Lost in Flight. All rights reserved.
//

import Alamofire
import PromiseKit

class FetchUser: NetworkRequest {
  typealias ResponseType = User
  
  var endpoint: String { return "post" }
  var method: Alamofire.Method { return .POST }
  var params: [String : AnyObject] { return ["param": username] }
  
  private var username = ""  
  func perform(username: String) -> Promise<User>
  {
    self.username = username
    
    return networkClient.performRequest(self)
                        .then(responseHandler)
  }
}