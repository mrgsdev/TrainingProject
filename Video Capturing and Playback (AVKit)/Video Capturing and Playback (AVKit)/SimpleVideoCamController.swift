//
//  SimpleVideoCamController.swift
//  Video Capturing and Playback (AVKit)
//
//  Created by MRGS on 04.07.2022.
//

import UIKit
 
class SimpleVideoCamController: UIViewController {

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
    
    @IBAction func unwindToCamera(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func capture(sender: AnyObject) {
    }

}
