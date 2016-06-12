//
//  ViewController.swift
//  NetworkingEvolution
//
//  Created by Austin Feight on 6/12/16.
//  Copyright © 2016 Lost in Flight. All rights reserved.
//

import UIKit
import Alamofire
import Swift

class ViewController: UIViewController {
  convenience init()
  {
    self.init(nibName: "ViewController", bundle: nil)
  }
  
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    let url = "http://httpbin.org/post"
    let params = ["param": "value"]
    request(.POST, url, parameters: params).responseJSON { response in
      switch response.result {
      case .Success(let result):
        let responseJSON = result as! [String: AnyObject]
        self.label.text = responseJSON["args"]["param"] as? String
      case .Failure(let error):
        print(error)
        self.label.text = "Request failed"
      }
    }
  }
}

