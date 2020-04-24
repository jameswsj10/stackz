//
//  SavedCollectionVC.swift
//  stackz
//
//  Created by James Jung on 4/22/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

extension SavedVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // when each post is tapped, pull up the post
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return demoFeed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Weekly", for: indexPath) as! SavedCollectionCell
        cell.title.text = demoFeed[indexPath.row].title
        
        return cell
    }
    
    
}
