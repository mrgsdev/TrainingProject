//
//  RecordProController.swift
//  Audio Recording and Playback
//
//  Created by MRGS on 30.06.2022.
//

import UIKit
import AVFoundation
class RecordProController: UIViewController {
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet private var stopButton: UIButton!
    @IBOutlet private var playButton: UIButton!
    @IBOutlet private var recordButton: UIButton!
    @IBOutlet private var timeLabel: UILabel!
    
    private func configure() {
        // Disable Stop/Play button when application launches
        stopButton.isEnabled = false
        playButton.isEnabled = false
        // Get the document directory. If fails, just skip the rest of the code
        guard let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else {
            let alertMessage = UIAlertController(title: "Error", message: "Failed to g et the document directory for recording the audio. Please try again later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler : nil))
            present(alertMessage, animated: true, completion: nil)
            return
        }
        // Set the default audio file
        let audioFileURL = directoryURL.appendingPathComponent("MyAudioMemo.m4a") // Setup audio session
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [ .defaultToSpeaker ])
            // Define the recorder setting
            
            let recorderSetting: [String: Any] = [
                
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 44100.0,
                
                AVNumberOfChannelsKey: 2,
                
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            // Initiate and prepare the recorder
            
            audioRecorder = try AVAudioRecorder(url: audioFileURL, settings: recorderSetting)
            
            audioRecorder.delegate = self
            
            audioRecorder.isMeteringEnabled = true
            
            audioRecorder.prepareToRecord()
        }
        catch {
            
            print(error)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Action methods
    
    @IBAction func stop(sender: UIButton) {
        
    }
    
    @IBAction func play(sender: UIButton) {
        
    }
    
    @IBAction func record(sender: UIButton) {
        
    }
    
}


extension RecordProController: AVAudioRecorderDelegate {
    
}
