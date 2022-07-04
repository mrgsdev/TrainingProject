//
//  SimpleVideoCamController.swift
//  Video Capturing and Playback (AVKit)
//
//  Created by MRGS on 04.07.2022.
//

import UIKit
import AVFoundation
class SimpleVideoCamController: UIViewController {
    
    @IBOutlet var cameraButton:UIButton!
    
    var currentDevice: AVCaptureDevice!
    let captureSession = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configure() {
        // Preset the session for taking photo in full resolution
        captureSession.sessionPreset = AVCaptureSession.Preset.high
        
        // Get the back-facing camera for capturing videos
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Failed to get the camera device")
            return
        }
        currentDevice = device
        // Get the input data source
        guard let captureDeviceInput = try? AVCaptureDeviceInput(device: currentDevice) else {
            return
        }
    }
    // MARK: - Action methods
    
    @IBAction func unwindToCamera(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func capture(sender: AnyObject) {
    }
    
}
