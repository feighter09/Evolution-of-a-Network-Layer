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
  func makeRequest(url: String,
                   params: [String : AnyObject],
                   callback: (JSON?, ErrorType?) -> Void)
}

struct NetworkClient: NetworkClientType {
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