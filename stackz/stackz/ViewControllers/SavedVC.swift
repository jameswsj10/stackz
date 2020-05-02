//
//  SavedVC.swift
//  stackz
//
//  Created by James Jung on 4/22/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class SavedVC: UIViewController {
    var ref = Database.database().reference()
//    var weekly: [Post]?
//    var monthly: [Post]?
//    var earlier: [Post]?
    var postToDisplay: Post?
    @IBOutlet weak var savedCollection: UICollectionView!
    var curUserSaved: [Post] = []
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        //curUserSaved =
        self.accessCurUserSaved()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print(self.curUserSaved)
            super.viewDidLoad()
            self.savedCollection.reloadData()
        }
        
    }
    
    func accessCurUserSaved() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        var user = Auth.auth().currentUser;
        let postRef = self.ref.child("Users/\(UserDefaults.standard.string(forKey: "ID")!)/saved")
        //var curUserPosts: [Post] = []
        let refHandle = postRef.observe(DataEventType.value, with: { (snapshot) in
            print("THIS IS THE SNAPSHOT: \(snapshot.value)")
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            for (key, val) in postDict {
                print(key, val)
                let post = Post(title: val["title"] as! String, text: val["text"] as! String)
                post.date = formatter.date(from: val["date"] as! String)!
                self.curUserSaved.append(post)
            }
        })
        self.savedCollection.reloadData()
        //return curUserPosts
    }
    
    
}
