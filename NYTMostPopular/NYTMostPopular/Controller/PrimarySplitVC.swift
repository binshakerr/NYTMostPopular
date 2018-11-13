//
//  PrimarySplitVC.swift
//  NYTMostPopular
//
//  Created by Eslam Shaker  on 11/13/18.
//  Copyright © 2018 Eslam Shaker . All rights reserved.
//

import UIKit

class PrimarySplitVC: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    
    func splitViewController(_ splitViewController: UISplitViewController,collapseSecondary secondaryViewController: UIViewController,onto primaryViewController: UIViewController) -> Bool {
        
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
   

}
