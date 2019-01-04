//
//  ViewController.swift
//  serverresponseUsingSingleton
//
//  Created by madhu on 12/28/18.
//  Copyright © 2018 madhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        APIServiceCalls.shared.getDataFromServer(serviceType: .topFree, onSucess: { (jsonData) in
            print(jsonData)
        }) { (eror) in
            print(eror)
        }
     
    }

}

