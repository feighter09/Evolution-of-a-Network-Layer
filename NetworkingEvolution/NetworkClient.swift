//
//  NetworkClient.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 8/10/16.
//  Copyright © 2016 Lost in Flight. All rights reserved.
//

import Alamofire
import SwiftyJSON
import PromiseKit

protocol NetworkClientType {
  func performRequest<Request: NetworkRequest>(networkRequest: Request) -> Promise<NSData>
}

struct NetworkClient: NetworkClientType {
  func performRequest<Request: NetworkRequest>(networkRequest: Request) -> Promise<NSData>
  {
    let (promise, success, failure) = Promise<NSData>.pendingPromise()
    
    request(networkRequest.method,
            networkRequest.url,
            parameters: networkRequest.params,
            encoding: networkRequest.encoding,
            headers: networkRequest.headers)
      .response { _, _, data, error in
        if let data = data where error == nil {
          success(data)
        }
        else if let error = error {
          failure(error)
        }
      }
    
    return promise
  }
}