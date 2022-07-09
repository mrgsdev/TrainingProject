//
//  DetailViewController.swift
//  View Controller Transitions and Animations
//
//  Created by MRGS on 09.07.2022.
//
import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}
