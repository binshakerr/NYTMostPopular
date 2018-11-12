//
//  ConnectionManager.swift
//  NYTMostPopular
//
//  Created by Eslam Shaker  on 11/12/18.
//  Copyright © 2018 Eslam Shaker . All rights reserved.
//

import Foundation
import Alamofire


class ConnectionManager {
    
    static let shared = ConnectionManager()
    
    func fetchCodableObject(method: HTTPMethod, url: String, parameters: [String: Any]?, encoding: ParameterEncoding, completed: @escaping (Data?, Error?)->() ){
        
        print("==============================")
        
        Alamofire.request("\(kBaseUrl)\(url)", method: method, parameters: parameters, encoding: encoding).responseJSON { response in
            
            print("URL is: \(response.request!.url!.absoluteString)")
            
            switch response.result {
            case .success(let value):
                print("Request success: \(value)")
                print("==============================")
                
                if (200 ... 299).contains(response.response!.statusCode) {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        completed(jsonData, nil)
                    } catch let error {
                        completed(nil, error)
                    }
                    
                } else {
                    let error = NSError(domain: "", code: response.response!.statusCode, userInfo: nil)
                    completed(nil,error)
                }
                
            case .failure(let error):
                print("Request failed: \(error.localizedDescription)")
                print("==============================")
                completed(nil, error)
            }
        }
    }
}
