//
//  ViewController.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 6/12/16.
//  Copyright © 2016 Lost in Flight. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class ViewController: UIViewController {
  convenience init() { self.init(nibName: "ViewController", bundle: nil) }
  
  @IBOutlet weak var label: UILabel!
  var networkClient: NetworkClientType = NetworkClient()
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    let url = "http://httpbin.org/post"
    let params = ["param": "feighter09"]

    networkClient.makeRequest(url, params: params) { json, error in
      if let json = json where error == nil {
        self.label.text = "Username: " + json["form"]["param"].stringValue
      }
      else {
        self.label.text = "Request failed"
      }
    }
  }
}

