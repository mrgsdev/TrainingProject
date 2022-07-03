//
//  SimpleCameraController.swift
//  Full Screen Camera with Gesture-based Controls
//
//  Created by MRGS on 03.07.2022.
//

import UIKit
import AVFoundation
class SimpleCameraController: UIViewController {

   
    @IBOutlet var cameraButton:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // MARK: - Action methods
    
    @IBAction func capture(sender: UIButton) {
    }

    // MARK: - Segues
    
    @IBAction func unwindToCameraView(segue: UIStoryboardSegue) {
    
    }
}
