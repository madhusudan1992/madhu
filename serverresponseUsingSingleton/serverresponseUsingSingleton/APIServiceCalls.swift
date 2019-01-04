//
//  APIServiceCalls.swift
//  serverresponseUsingSingleton
//
//  Created by madhu on 12/28/18.
//  Copyright © 2018 madhu. All rights reserved.
//

import UIKit

class APIServiceCalls: NSObject {
    
    static let shared = APIServiceCalls()
   private override init() {
        
    }
    func getDataFromServer(serviceType:serviceTypeMethod,onSucess:@escaping (Any)->(),onFailure:@escaping (Any)->()){
        
        guard let UrlData = URL(string: "https://rss.itunes.apple.com/api/v1/in/ios-apps/\(serviceType.rawValue)/all/10/explicit.json") else{return}
      //let  URLRequestData = URLRequest(url: UrlData)
        URLSession.shared.dataTask(with: UrlData) { (data, resp, error) in
            do{
                let jsonData = try  JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                
               // print(jsonData)
                onSucess(jsonData)
            }
            catch{
             //   print(error.localizedDescription)
                onFailure(error.localizedDescription)
            }
        
        }.resume()
        
        
    }

}
