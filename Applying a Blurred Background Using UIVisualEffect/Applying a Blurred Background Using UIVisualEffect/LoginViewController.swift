//
//  LoginViewController.swift
//  Applying a Blurred Background Using UIVisualEffect
//
//  Created by MRGS on 17.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    private let imageSet = ["cloud", "coffee", "food", "pmq", "temple"]
    private var blurEffectView: UIVisualEffectView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Randomly pick an image
        let selectedImageIndex = Int.random(in: 0..<imageSet.count)
        // Apply blurring effect
        backgroundImageView.image = UIImage(named: imageSet[selectedImageIndex])
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView!)
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        blurEffectView?.frame = view.bounds
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
