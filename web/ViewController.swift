//
//  ViewController.swift
//  web
//
//  Created by Ezequiel Parada Beltran on 07/07/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.youtube.com")
        
        webView.load(URLRequest(url: url!))
        
        
    }


}

