//
//  FetchUser.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 8/10/16.
//  Copyright © 2016 Lost in Flight. All rights reserved.
//

import Alamofire

class FetchUser: NetworkRequest {
  typealias ResponseType = User
  
  var endpoint: String { return "post" }
  var method: Alamofire.Method { return .POST }
  var params: [String : AnyObject] { return ["param": username] }
  
  private var username = ""  
  func perform(username: String, callback: (User?, ErrorType?) -> Void)
  {
    self.username = username
    
    let parsedCallback = { (data: NSData?, error: ErrorType?) in
      callback(data.flatMap(self.responseHandler), error)
    }    
    networkClient.makeRequest(self, callback: parsedCallback)
  }
}