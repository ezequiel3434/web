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
    
    /*
     https://es.wikipedia.org/w/api.php?action=query&prop=extracts&format=json&exintro=&titles=sega
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func search(_ sender: Any) {
        
        if textField.text!.isEmpty {
            return
        }else{
            palabra = textField.text!
        }
        
        let urlCompleto = "https://es.wikipedia.org/w/api.php?action=query&prop=extracts&format=json&exintro=&titles=\(palabra!.replacingOccurrences(of:" ", with: "%20"))"
        
        let objetoURL = URL(string: urlCompleto)
        
        let task = URLSession.shared.dataTask(with: objetoURL!, completionHandler: { (data, res, error) in
            if error != nil {
                print(error!)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]
                    
                    let querySubJson = json["query"] as! [String:Any]
                    
                    let pagesSubJson = querySubJson["pages"] as! [String:Any]
                    
                    let pageId = pagesSubJson.keys
                    let firstKey = pageId.first!
                    let numSubJson = pagesSubJson[firstKey] as! [String:Any]
                    
                    let extractSubJson = numSubJson["extract"] as! String
                    
                    
                        if extractSubJson == "" {

                                       

                                       DispatchQueue.main.sync(execute:

                                           {

                                               self.webView.loadHTMLString("EL TEXTO ESTA MAL ESCRITO", baseURL: nil)

                                               

                                       })

                                   } else{

                                       

                                       DispatchQueue.main.sync(execute:

                                       {

                                           self.webView.loadHTMLString(extractSubJson, baseURL: nil)

                                       }) // todo lo que esta dentro del Parentecis es como precentamos el resultado de lo que pedimos

                                       

                                       print("ENTRAMOS EN ELSE ")

                                   }
                    
                   
                    
                    
                    
                } catch  {
                    print("El procesamiento del JSON tuvo un error")
                }
            }
        })
        
        task.resume()
        
        
    }
    


}

