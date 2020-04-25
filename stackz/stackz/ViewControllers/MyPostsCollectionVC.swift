//
//  MyPostsCollectionVC.swift
//  stackz
//
//  Created by James Jung on 4/22/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

extension MyPostsVC: UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return demoFeed.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myPosts", for: indexPath) as! MyPostsCollectionCell
        cell.title.text = demoFeed[indexPath.row].title
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 320)
    }

}
