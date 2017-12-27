//
//  ViewController.swift
//  UIView inside UIScrollView Sample
//
//  Created by Admin on 12/27/17.
//  Copyright © 2017 TestCo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var webViewHeightConstraint: NSLayoutConstraint!
    
    // MARK:- ViewController Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //for testing
        webView.backgroundColor = UIColor.red
        viewContainer.backgroundColor = UIColor.blue
        scrollView.backgroundColor = UIColor.purple
        
        //Load URL
        webView.loadRequest(URLRequest(url: URL(string: "http://www.mrxprt.com/blog")!))
    }
    
    
    // MARK:- ViewController Life Cycle Method
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        DispatchQueue.main.async(execute: {
            webView.scrollView.showsHorizontalScrollIndicator = false
            
            var frame = webView.frame;
            
            var scrollViewContentHeight = self.scrollView.contentSize.height - frame.size.height
            let fittingSize = webView.sizeThatFits(frame.size);
            scrollViewContentHeight = scrollViewContentHeight + fittingSize.height
            
            frame.size.height = fittingSize.height;
            self.scrollView.contentSize = CGSize(width: self.scrollView.contentSize.width, height: scrollViewContentHeight)
             self.webViewHeightConstraint.constant = fittingSize.height
            
        })
        
        
    }
}

