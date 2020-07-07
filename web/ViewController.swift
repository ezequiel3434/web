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
    @IBOutlet weak var textField: UITextField!
    var palabra: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.youtube.com")
        
        let peticion = URLRequest(url: url!)
        let tarea = URLSession.shared.dataTask(with: peticion) { (data, response, error) in
            
            if error == nil {
                let datosString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                
                DispatchQueue.main.sync(execute: {
                    print(datosString!)
                })
            } else {
                print(error!)
            }
        }
        
        tarea.resume()
        
    }
    
    @IBAction func search(_ sender: Any) {
        
        if textField.text!.isEmpty {
            
        }else{
            palabra = textField.text!
        }
        
        
    }
    


}

