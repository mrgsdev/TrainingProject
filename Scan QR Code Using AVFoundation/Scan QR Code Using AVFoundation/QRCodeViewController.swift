//
//  QRCodeViewController.swift
//  Scan QR Code Using AVFoundation
//
//  Created by MRGS on 01.07.2022.
//

import UIKit

class QRCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    // MARK: - Navigation

     @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
         dismiss(animated: true, completion: nil)
     }
   

}
