//
//  secondViewController.swift
//  serverresponseUsingSingleton
//
//  Created by madhu on 12/28/18.
//  Copyright © 2018 madhu. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     //  APIServiceCalls.shared.getDataFromServer(serviceType: "top-paid")
        
        APIServiceCalls.shared.getDataFromServer(serviceType:.topPaid, onSucess: { (jsonData) in
            print(jsonData)
        }) { (errorMessage) in
            print(errorMessage)
        }
    }

  

}
