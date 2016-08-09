//
//  JSONDecodable.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 8/10/16.
//  Copyright © 2016 Lost in Flight. All rights reserved.
//

import SwiftyJSON

protocol JSONDecodable {
  init(json: JSON) throws
}