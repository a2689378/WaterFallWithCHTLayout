//
//  ViewController.swift
//  WaterFallWithCHTLayout
//
//  Created by 何常凱 on 2023/6/18.
//

import UIKit

private let reuseIdentifier = "Cell"

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 设置UICollectionViewFlowLayout的属性
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // 设置上下左右的间距
            layout.minimumLineSpacing = 10 // 设置CollectionViewCell之间的垂直间距
            layout.minimumInteritemSpacing = 10 // 设置CollectionViewCell之间的水平间距
            
            // 设置CollectionView的每行显示的列数为2
            let numberOfColumns: CGFloat = 2
            let itemWidth = (collectionView.bounds.width - layout.sectionInset.left - layout.sectionInset.right - (numberOfColumns - 1) * layout.minimumInteritemSpacing) / numberOfColumns
            layout.itemSize = CGSize(width: itemWidth, height: itemWidth) // 这里假设Cell的宽高相等
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: "\(indexPath.item + 1)")
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    
}

