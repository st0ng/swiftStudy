//
//  StretchCollectionViewVC.swift
//  SwiftStudy
//
//  Created by hyukjun on 2021/08/04.
//

import UIKit

class StretchCollectionViewVC: UIViewController {
    
    let headerView = "CollectionReusableView"
    let cell = "CollectionViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        self.configurationCollectionView()
    }
    
    func setNavigation() {
        self.navigationController?.title = "StretchCollection"
        self.navigationController?.isNavigationBarHidden = false
        
        let backBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: nil)
        self.navigationController?.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    func configurationCollectionView() {
        
        self.collectionView.register(UINib(nibName: self.cell, bundle: nil), forCellWithReuseIdentifier: self.cell)
//        self.collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: self.headerView)
        self.collectionView.register(UINib(nibName: self.headerView, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: self.headerView)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let flowLayout = CollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.headerReferenceSize = .init(width: self.view.frame.width, height: 300)
        self.collectionView.collectionViewLayout = flowLayout
        
    }
}


extension StretchCollectionViewVC: UICollectionViewDelegate {
    
}


extension StretchCollectionViewVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! CollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = self.collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.headerView, for: indexPath) as! CollectionReusableView
        return header
    }
}


class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        guard let offset = collectionView?.contentOffset, let stLayoutAttributes = layoutAttributes else {
            return layoutAttributes
            
        }
        if offset.y < 0 {
            
            for attributes in stLayoutAttributes {
                
                if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {
                    let diffValue = abs(offset.y)
                    
                    var frame = attributes.frame
                    frame.size.height = max(0, headerReferenceSize.height + diffValue)
                    frame.origin.y = frame.minY - diffValue
                    attributes.frame = frame
                    }
                
            }
            
        }
        return layoutAttributes
        
    }
}
