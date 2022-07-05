//
//  ViewController.swift
//  Working with Custom Fonts and Dynamic Type
//
//  Created by MRGS on 05.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
///       Using Custom Fonts in Code
//        label1.font = UIFont(name: "Mohave-Italic", size: 25.0)
//        label2.font = UIFont(name: "Hallo sans", size: 30.0)
//        label3.font = UIFont(name: "Canter Light", size: 35.0)
///     Dynamic Type
//        label1.font = UIFont.preferredFont(forTextStyle: .title1)
//        label2.font = UIFont.preferredFont(forTextStyle: .headline)
//        label3.font = UIFont.preferredFont(forTextStyle: .subheadline)
//
/// CustomFont + DynamicType

        if let customFont1 = UIFont(name: "Mohave-Italic", size: 28.0) { let fontMetrics = UIFontMetrics(forTextStyle: .title1)
            label1.font = fontMetrics.scaledFont(for: customFont1)
        }
        if let customFont2 = UIFont(name: "Hallo sans", size: 20.0) {
            let fontMetrics = UIFontMetrics(forTextStyle: .headline)
            label2.font = fontMetrics.scaledFont(for: customFont2)
        }
        if let customFont3 = UIFont(name: "CanterLight", size: 17.0) {
            let fontMetrics = UIFontMetrics(forTextStyle: .subheadline)
            label3.font = fontMetrics.scaledFont(for: customFont3)
        }
        
        label1.adjustsFontForContentSizeCategory = true
        label2.adjustsFontForContentSizeCategory = true
        label3.adjustsFontForContentSizeCategory = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
     


}

