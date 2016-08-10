//
//  NetworkClient.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 8/10/16.
//  Copyright © 2016 Lost in Flight. All rights reserved.
//

import Alamofire
import SwiftyJSON

protocol NetworkClientType {
  func fetchUsername(callback: (String?, ErrorType?) -> Void)
  func makeRequest(url: String,
                   params: [String : AnyObject],
                   callback: (JSON?, ErrorType?) -> Void)
}

struct NetworkClient: NetworkClientType {
  func fetchUsername(callback: (String?, ErrorType?) -> Void)
  {
    let url = "http://httpbin.org/post"
    let params = ["param": "feighter09"]

    makeRequest(url, params: params) { json, error in
      if let json = json,
         let username = json["form"]["param"].string {
        callback(username, nil)
      }
      else {
        callback(nil, error)
      }
    }
  }
  
  func makeRequest(url: String,
                   params: [String : AnyObject],
                   callback: (JSON?, ErrorType?) -> Void)
  {
    request(.POST, url, parameters: params).response { _, _, data, error in
      if let jsonData = data where error == nil {
        let json = JSON(data: jsonData)
        callback(json, nil)
      }
      else {
        callback(nil, error)
      }
    }
  }
}