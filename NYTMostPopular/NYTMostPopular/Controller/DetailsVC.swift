//
//  DetailsVC.swift
//  NYTMostPopular
//
//  Created by Eslam Shaker  on 11/13/18.
//  Copyright © 2018 Eslam Shaker . All rights reserved.
//

import UIKit
import WebKit


class DetailsVC: UIViewController, WKNavigationDelegate {
    
    var passedResult : Result?
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.translatesAutoresizingMaskIntoConstraints = false
        view = webView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let result = passedResult {
            
            self.title = result.title
            
            let url = URL(string: result.url)!
            webView.load(URLRequest(url: url))
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    
    
    @IBAction func shareBtnPressed(_ sender: Any) {
        if let url = passedResult?.url {
            let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            self.present(activityViewController, animated: true, completion: nil)
        }
        
    }
    
    
    
}
