//
//  NetworkRequest.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 8/10/16.
//  Copyright © 2016 Lost in Flight. All rights reserved.
//

import Alamofire
import SwiftyJSON

protocol NetworkRequest {
  associatedtype ResponseType
  
  // Required
  var endpoint: String { get }
  var responseHandler: NSData -> ResponseType? { get }
  
  // Optional
  var baseUrl: String { get }
  var method: Alamofire.Method { get }
  var encoding: ParameterEncoding { get }
  
  var params: [String : AnyObject] { get }
  var headers: [String : String] { get }
  
  var networkClient: NetworkClientType { get }
}

extension NetworkRequest {
  var url: String { return baseUrl + endpoint }
  var baseUrl: String { return "http://httpbin.org/" }
  var method: Alamofire.Method { return .GET }
  var encoding: ParameterEncoding { return .JSON }
  
  var params: [String : AnyObject] { return [:] }
  var headers: [String : String] { return [:] }
  
  var networkClient: NetworkClientType { return NetworkClient() }
}

extension NetworkRequest where ResponseType: JSONDecodable {
  var responseHandler: NSData -> ResponseType? { return jsonResponseHandler }
}

private func jsonResponseHandler<Response: JSONDecodable>(data: NSData) -> Response?
{
  let json = JSON(data: data)
  return Response(json: json)
}