//
//  CHTCollectionVC.swift
//  WaterFallWithCHTLayout
//
//  Created by 何常凱 on 2023/6/18.
//

import UIKit
import CHTCollectionViewWaterfallLayout


class CHTCollectionVC: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //配置属性
        let layout = collectionView.collectionViewLayout as! CHTCollectionViewWaterfallLayout
        
        layout.columnCount = 2 //两列
        layout.minimumColumnSpacing = 4//左右
        layout.minimumInteritemSpacing = 4//上下
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)//距离屏幕
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 12
    }
    //替换成storyboard的cellid
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CHTCellID", for: indexPath) as! CHTCell
        cell.imageView.image = UIImage(named: "\(indexPath.item + 1)")
    
        return cell
    }


}

// MARK: - CHTCollectionViewDelegateWaterfallLayout
extension CHTCollectionVC: CHTCollectionViewDelegateWaterfallLayout {
    //cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        UIImage(named: "\(indexPath.item + 1)")!.size
    }
    
    
}
