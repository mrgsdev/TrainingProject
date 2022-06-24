//
//  KivaLoanTableViewController.swift
//  Working with JSON and Codable
//
//  Created by MRGS on 24.06.2022.
//

import UIKit

class KivaLoanTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 92.0
        tableView.rowHeight = UITableView.automaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
