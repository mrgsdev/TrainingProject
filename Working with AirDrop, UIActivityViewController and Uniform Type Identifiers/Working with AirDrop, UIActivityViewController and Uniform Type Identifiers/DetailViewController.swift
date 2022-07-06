//
//  DetailViewController.swift
//  Working with AirDrop, UIActivityViewController and Uniform Type Identifiers
//
//  Created by MRGS on 06.07.2022.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    var filename = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the full path of the file
        if let fileURL = fileToURL(file: filename) {
            let urlRequest = URLRequest(url: fileURL)
            webView.load(urlRequest)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fileToURL(file: String) -> URL? {
        // Get the full path of the file
        let fileComponents = file.components(separatedBy: ".")
        
        if let filePath = Bundle.main.path(forResource: fileComponents[0], ofType: fileComponents[1]) {
            return URL(fileURLWithPath: filePath)
        }
        
        return nil
    }
    @IBAction func share(sender: AnyObject) {
        
    }
}
