//
//  IconCollectionViewController.swift
//  Grid Layouts Using Collection Views and Diffable Data Source
//
//  Created by MRGS on 07.07.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class IconCollectionViewController: UICollectionViewController {
    
    private var iconSet: [Icon] = [
        Icon(name: "candle", price: 3.99, isFeatured: false),
        Icon(name: "cat", price: 2.99, isFeatured: true),
        Icon(name: "dribbble", price: 1.99, isFeatured: false),
        Icon(name: "ghost", price: 4.99, isFeatured: false),
        Icon(name: "hat", price: 2.99, isFeatured: false),
        Icon(name: "owl", price: 5.99, isFeatured: true),
        Icon(name: "pot", price: 1.99, isFeatured: false),
        Icon(name: "pumkin", price: 0.99, isFeatured: false),
        Icon(name: "rip", price: 7.99, isFeatured: false),
        Icon(name: "skull", price: 8.99, isFeatured: false),
        Icon(name: "sky", price: 0.99, isFeatured: false),
        Icon(name: "toxic", price: 2.99, isFeatured: false),
        Icon(name: "ic_book", price: 2.99, isFeatured: false),
        Icon(name: "ic_backpack", price: 3.99, isFeatured:false),
        Icon(name: "ic_camera", price: 4.99, isFeatured: false),
        Icon(name: "ic_coffee", price: 3.99, isFeatured:true),
        Icon(name: "ic_glasses", price: 3.99, isFeatured:false),
        Icon(name: "ic_ice_cream", price: 4.99, isFeatured:false),
        Icon(name: "ic_smoking_pipe", price: 6.99, isFeatured: false),
        Icon(name: "ic_vespa", price: 9.99, isFeatured: false)
    ]
    
    // MARK: UICollectionDiffableDataSource
    lazy var dataSource = configureDataSource()
    enum Section {
        case all
    }
    func configureDataSource() -> UICollectionViewDiffableDataSource<Section, Icon> {
        let dataSource = UICollectionViewDiffableDataSource<Section, Icon>(collectionView: collectionView) {
            (collectionView, indexPath, icon) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IconCollectionViewCell
            
            cell.iconImageView.image = UIImage(named: icon.name)
            cell.iconPriceLabel.text = "$\(icon.price)"
            
            return cell
            
        }
        return dataSource
    }
    
    func updateSnapshot(animatingChange: Bool = false) {
        // Create a snapshot and populate the data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Icon>()
        snapshot.appendSections([.all])
        snapshot.appendItems(iconSet, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = dataSource
        updateSnapshot()
       
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    
    // MARK: UICollectionViewDelegate
    
    
    
}
//extension IconCollectionViewController{
//    func estimateSize()  {
//        if let layout = collectionViewLayout as? UICollectionViewFlowLayout { layout.itemSize = CGSize(width: 100, height: 150)
//            layout.estimatedItemSize = .zero
//            layout.scrollDirection = .horizontal
//            layout.minimumInteritemSpacing = 20
//        }
//    }
//}
