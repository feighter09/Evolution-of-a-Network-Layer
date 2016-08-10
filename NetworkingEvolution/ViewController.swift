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
  var fetchUser = FetchUser()
  
  override func viewDidLoad()
  {
    super.viewDidLoad()

    fetchUser.perform("feighter09") { (user: User?, error: ErrorType?) in
      if let user = user {
        self.label.text = "Username: " + user.name
      }
      else {
        self.label.text = "Request failed"
      }
    }
  }
}

