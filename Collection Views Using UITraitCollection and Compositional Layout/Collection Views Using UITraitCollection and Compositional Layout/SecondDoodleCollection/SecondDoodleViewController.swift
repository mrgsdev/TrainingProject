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
    
    enum Section: Int {
        case office
        case kitchen
        case macbook
        
        var columnCount: Int {
            switch self {
            case .office: return 1
            case .kitchen: return 2
            case .macbook: return 4
            }
        }
        
        var name: String {
            switch self {
            case .office: return "Office"
            case .kitchen: return "Kitchen"
            case .macbook: return "MacBook"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeader()
        collectionView.dataSource = dataSource
        collectionView.collectionViewLayout =  createMultiGridLayout()
        
        
        
        updateSnapshot()
    }
    
    private func createGridLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(80.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
        
    }
    
    private func createMultiGridLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            var column = 1
            
            if let dataSection = Section(rawValue: sectionIndex) {
                column = dataSection.columnCount
            }
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/CGFloat(column)),heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(sectionIndex == 0 ? 200 : 80.0))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            
            let section = NSCollectionLayoutSection(group: group)
            if sectionIndex == 0 {
                section.orthogonalScrollingBehavior = .paging
            }
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
            let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)

            section.boundarySupplementaryItems = [headerElement]
            
            return section
        }
        
        return layout
        
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
        snapshot.appendSections([.office, .kitchen, .macbook])
        snapshot.appendItems(officeImages, toSection: .office)
        snapshot.appendItems(kitchenImages, toSection: .kitchen)
        snapshot.appendItems(macbookImages, toSection: .macbook)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}




extension SecondDoodleViewController{
    func configureHeader()  {
        dataSource.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in
            
            if kind == UICollectionView.elementKindSectionFooter {
                return nil
            }
            
            let headerView: SectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! SectionHeaderView
            
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            
            headerView.titleLabel.text = section.name
            
            return headerView
        }
    }
}

