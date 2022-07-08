//
//  DoodleViewController.swift
//  Collection Views Using UITraitCollection and Compositional Layout
//
//  Created by MRGS on 08.07.2022.
//

import UIKit

class DoodleViewController: UIViewController {
    enum Section {
        case all
    }
    lazy var dataSource = configureDataSource()
    private var doodleImages = (1...20).map { "DoodleIcons-\($0)" }
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 128, height: 128)
            layout.estimatedItemSize = .zero
//            layout.minimumInteritemSpacing = 2
        }
        updateSnapshot()
    }
    
    func updateSnapshot(animatingChange: Bool = false) {
        // Create a snapshot and populate the data
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(doodleImages, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: false)
        
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
extension DoodleViewController {
    func configureDataSource() -> UICollectionViewDiffableDataSource<Section, String> {
        
        let dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView) { (collectionView, indexPath, imageName) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DoodleCollectionViewCell
            
            cell.imageView.image = UIImage(named: imageName)
            
            return cell
            
        }
        return dataSource
    }
}
extension DoodleViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sideSize = (traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular) ? 80.0 : 128.0
        return CGSize(width: sideSize, height: sideSize)
    }
}
