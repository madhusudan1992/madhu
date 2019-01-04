//
//  ThirdViewController.swift
//  serverresponseUsingSingleton
//
//  Created by madhu on 12/28/18.
//  Copyright © 2018 madhu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // https://rss.itunes.apple.com/api/v1/in/ios-apps/top-grossing-ipad/all/10/explicit.json
        
        
       // APIServiceCalls.shared.getDataFromServer(serviceType: "top-grossing-ipad")
        
        APIServiceCalls.shared.getDataFromServer(serviceType: .topgross, onSucess: { (jsonData) in
            print(jsonData)
        }) { (errorMessage) in
            print(errorMessage)
        }
    }

  

}
