//
//  detailViewController.swift
//  API_practice
//
//  Created by MACUser on 2020/08/06.
//  Copyright © 2020 MACUser. All rights reserved.
//

import UIKit
import WebKit

class detailViewController: UIViewController {


    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //let url = URL(string: "https://www.google.com")
        //let urlRequest = URLRequest(url: "https://www.google.com")
        //webview.load(urlRequest)
        //let myURL = URL(string:"https://www.google.com")
        //let myRequest = URLRequest(url: myURL!)
        //webview.load(myRequest)
        webview.load(URLRequest(url: URL(string: "https://www.google.com")!))
    }
}
