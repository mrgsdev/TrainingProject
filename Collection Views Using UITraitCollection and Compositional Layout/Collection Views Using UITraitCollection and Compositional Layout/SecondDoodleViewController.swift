//
//  SecondDoodleViewController.swift
//  Collection Views Using UITraitCollection and Compositional Layout
//
//  Created by MRGS on 08.07.2022.
//

import UIKit

class SecondDoodleViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    private var officeImages = (1...15).map { "office-\($0)" }
    private var kitchenImages = (1...25).map { "kitchen-\($0)" }
    private var macbookImages = (1...30).map { "macbook-\($0)" }
    
    lazy var dataSource = configureDataSource()
    
    enum Section {
        case all
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            layout.itemSize = CGSize(width: 80, height: 80)
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.estimatedItemSize = .zero
        }
        
        collectionView.dataSource = dataSource
        
        updateSnapshot()
    }


}

// MARK: - Diffable Data Source

extension SecondDoodleViewController {
    
    func configureDataSource() -> UICollectionViewDiffableDataSource<Section, String> {

        let dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView) { (collectionView, indexPath, imageName) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondcell", for: indexPath) as! SecondDoodleControllerViewCell
            cell.imageView.image = UIImage(named: imageName)
            
            return cell
        }

        return dataSource
    }
    
    func updateSnapshot(animatingChange: Bool = false) {

        // Create a snapshot and populate the data
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(macbookImages, toSection: .all)

        dataSource.apply(snapshot, animatingDifferences: false)
    }
}



