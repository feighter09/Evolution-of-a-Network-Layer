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
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    let url = "http://httpbin.org/post"
    let params = ["param": "feighter09"]
    
    request(.POST, url, parameters: params).response { _, _, data, error in
      if let jsonData = data where error == nil {
        let json = JSON(data: jsonData)
        self.label.text = "Username: " + json["form"]["param"].stringValue
      }
      else {
        self.label.text = "Request failed"
      }
    }
  }
}

