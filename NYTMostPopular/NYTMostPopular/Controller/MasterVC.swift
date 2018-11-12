//
//  MasterVC.swift
//  NYTMostPopular
//
//  Created by Eslam Shaker  on 11/12/18.
//  Copyright © 2018 Eslam Shaker . All rights reserved.
//

import UIKit

class MasterVC: UITableViewController {
    
    var results = [Result]()

    override func viewDidLoad() {
        super.viewDidLoad()

        getHits()
    }
    
    
    func getHits(){
        
        startActivityIndicator(style: nil, location: nil, customColor: nil)
        
        APIManager.shared.getHit { [weak self] (hit, error) in
            if error != nil {
                self?.stopActivityIndicator()
                self?.alertError(message: error!.localizedDescription)
                return
            }
            
            if let returnedHit = hit {
                self?.stopActivityIndicator()
                self?.results = returnedHit.results
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterCell", for: indexPath) as! MasterCell


        return cell
    }
    
    

}
