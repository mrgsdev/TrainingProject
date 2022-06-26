//
//  KivaLoanTableViewController.swift
//  Working with JSON and Codable
//
//  Created by MRGS on 24.06.2022.
//

import UIKit

class KivaLoanTableViewController: UITableViewController {
    
    private let kivaLoanURL = "https://api.kivaws.org/v1/loans/newest.json"
    private var loans = [Loan]() 
    
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 92.0
        tableView.rowHeight = UITableView.automaticDimension
        getLatestLoans()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension KivaLoanTableViewController{
    func getLatestLoans() {
        guard let loanUrl = URL(string: kivaLoanURL) else {
            return
        }
        
        let request = URLRequest(url: loanUrl)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            
            if let error = error {
                print(error)
                return
            }
            
            // Parse JSON data
            if let data = data {
                self.loans = self.parseJsonData(data: data)
                
                // Update table view's data
                OperationQueue.main.addOperation({
                    self.updateSnapshot()
                })
            }
        })
        
        task.resume()
    }
    
    func parseJsonData(data: Data) -> [Loan] {
        var loans = [Loan]()
        let decoder = JSONDecoder()
        do {
            let loanDataStore = try decoder.decode(LoanDataStore.self, from: data)
            loans = loanDataStore.loans
        } catch {
            print(error)
        }
        return loans
    }
    
    func configureDataSource() -> TableDDS {
        
        let cellIdentifier = "Cell"
        
        let dataSource = TableDDS(
            tableView: tableView,
            cellProvider: {  tableView, indexPath, loan in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! KivaLoanTableViewCell
                
                cell.nameLabel.text = loan.name
                cell.countryLabel.text = loan.country
                cell.useLabel.text = loan.use
                cell.amountLabel.text = "$\(loan.amount)"
                
                return cell
            }
        )
        
        return dataSource
    }
    
    func updateSnapshot(animatingChange: Bool = false) {
        
        // Create a snapshot and populate the data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Loan>()
        snapshot.appendSections([.all])
        snapshot.appendItems(loans, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: animatingChange)
    }
}
