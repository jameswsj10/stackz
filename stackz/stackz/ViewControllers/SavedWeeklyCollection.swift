//
//  SavedCollectionVC.swift
//  stackz
//
//  Created by James Jung on 4/22/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

extension SavedVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // when each post is tapped, pull up the post
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return curUserSaved.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Weekly", for: indexPath) as! SavedCollectionCell
        cell.title.text = curUserSaved[indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        postToDisplay = curUserSaved[indexPath.row]
        self.performSegue(withIdentifier: "savedToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let details = segue.destination as? PostDetailVC, segue.identifier == "savedToDetail" {
            details.recievedPost = self.postToDisplay
        }
    }

}
