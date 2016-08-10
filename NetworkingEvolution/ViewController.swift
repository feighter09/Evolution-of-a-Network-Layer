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
    
    networkClient.fetchUsername  { username, error in
      if let username = username {
        self.label.text = "Username: " + username
      }
      else {
        self.label.text = "Request failed"
      }
    }
  }
}

