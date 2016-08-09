//
//  User.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 8/10/16.
//  Copyright © 2016 Lost in Flight. All rights reserved.
//

import SwiftyJSON

struct User {
  let name: String
}

// MARK: - JSON Decodable
extension User: JSONDecodable {
  init(json: JSON) throws
  {
    guard let name = json["json"]["param"].string
      else { throw JSONError.MissingKey("json.param") }
    
    self.name = name
  }
}
