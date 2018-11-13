//
//  APIManager.swift
//  NYTMostPopular
//
//  Created by Eslam Shaker  on 11/12/18.
//  Copyright © 2018 Eslam Shaker . All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()

    func getHit(completed: @escaping (Hit?, Error?)->()) {
        let url = "\(kMostPopularUrl)/7.json?api-key=\(kApiKey)"
        
        ConnectionManager.shared.fetchCodableObject(method: .get, url: url, parameters: nil, encoding: JSONEncoding.default) { (result, error) in
            
            if error != nil {
                completed(nil, error!)
            }
            
            guard let json = result else {return}
            
            do {
                let hit = try JSONDecoder().decode(Hit.self, from: json)
                completed(hit, nil)
            } catch let error {
                print("Error creating object from JSON: \(error.localizedDescription)")
                completed(nil, error)
            }
        }
    }
    
}
