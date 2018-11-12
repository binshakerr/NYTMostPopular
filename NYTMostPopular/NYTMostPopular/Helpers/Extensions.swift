//
//  Extensions.swift
//  NYTMostPopular
//
//  Created by Eslam Shaker  on 11/13/18.
//  Copyright © 2018 Eslam Shaker . All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alertError(message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Error", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    var activityIndicatorTag: Int { return 999999 } // a random number, just make sure no other views are using the same number
    
    func startActivityIndicator(style: UIActivityIndicatorView.Style?,location: CGPoint?, customColor: UIColor?) {
        
        //default style and position
        let styl = style ?? .gray
        let loc = location ?? self.view.center
        
        //Ensure the UI is updated from the main thread
        //in case this method is called from a closure
        DispatchQueue.main.async {
            
            let activityIndicator = UIActivityIndicatorView(style: styl)
            
            //Add the tag so we can find the view in order to remove it later
            activityIndicator.tag = self.activityIndicatorTag
            
            //Set the location
            activityIndicator.center = loc
            
            //if it has a custom color, show it
            if let color = customColor {
                activityIndicator.color = color
            }
            
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        }
    }
    
    
    func stopActivityIndicator() {
        
        DispatchQueue.main.async{
            if let activityIndicator = self.view.subviews.filter(
                { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
    
    
}
