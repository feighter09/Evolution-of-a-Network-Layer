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
  func makeRequest<Request: NetworkRequest>(networkRequest: Request, callback: (NSData?, ErrorType?) -> Void)
}

struct NetworkClient: NetworkClientType {
  func makeRequest<Request: NetworkRequest>(networkRequest: Request, callback: (NSData?, ErrorType?) -> Void)
  {
    request(networkRequest.method,
            networkRequest.url,
            parameters: networkRequest.params,
            encoding: networkRequest.encoding,
            headers: networkRequest.headers)
      .response { _, _, data, error in
        if let data = data where error == nil {
          callback(data, nil)
        }
        else {
          callback(nil, error)
        }
      }
  }
}