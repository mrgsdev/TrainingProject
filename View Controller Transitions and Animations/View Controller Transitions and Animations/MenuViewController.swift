//
//  MenuViewController.swift
//  View Controller Transitions and Animations
//
//  Created by MRGS on 09.07.2022.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!

    private var menuItems = [ MenuItem(name: "Slide Down", imageName: "Doodle Icons-41"),
                              MenuItem(name: "Slide Right", imageName: "Doodle Icons-42"),
                              MenuItem(name: "Pop", imageName: "Doodle Icons-43"),
                              MenuItem(name: "Rotate", imageName: "Doodle Icons-44")
                            ]
        
    enum Section {
        case all
    }
    
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = dataSource
        collectionView.collectionViewLayout = createGridLayout()
        
        updateSnapshot()
        
    }

    private func createGridLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(120.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 5, trailing: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
        
    }

}

// MARK: - Diffable Data Source

extension MenuViewController {
    
    func configureDataSource() -> UICollectionViewDiffableDataSource<Section, MenuItem> {

        let dataSource = UICollectionViewDiffableDataSource<Section, MenuItem>(collectionView: collectionView) { (collectionView, indexPath, imageName) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenuCell
        
            if let item = self.dataSource.itemIdentifier(for: indexPath) {
                cell.titleLabel.text = item.name
                cell.thumbnailImageView.image = UIImage(named: item.imageName)
            }
            
            return cell
        }

        return dataSource
    }

    func updateSnapshot(animatingChange: Bool = false) {

        // Create a snapshot and populate the data
        var snapshot = NSDiffableDataSourceSnapshot<Section, MenuItem>()
        snapshot.appendSections([.all])
        snapshot.appendItems(menuItems, toSection: .all)

        dataSource.apply(snapshot, animatingDifferences: false)
    }
}



