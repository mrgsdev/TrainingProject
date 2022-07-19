//
//  TripViewController.swift
//  Carousel-Like User Interface with Paging Support
//
//  Created by MRGS on 19.07.2022.
//

import UIKit

class TripViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apply blurring effect
        backgroundImageView.image = UIImage(named: "cloud")
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
