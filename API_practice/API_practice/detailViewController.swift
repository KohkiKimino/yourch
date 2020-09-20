//
//  DetailViewController.swift
//  API_practice
//
//  Created by MACUser on 2020/08/06.
//  Copyright © 2020 MACUser. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var url:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        if let myURL = URL(string:url) {
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
            self.view.addSubview(webView)
        }
    }
}
