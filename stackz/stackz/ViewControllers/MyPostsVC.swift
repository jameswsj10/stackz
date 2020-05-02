//
//  MyPostsVC.swift
//  stackz
//
//  Created by James Jung on 4/22/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MyPostsVC: UIViewController {
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var searchBar: UISearchBar!
    var curUserPosts : [Post] = []
    var ref = Database.database().reference()
    var postToDisplay : Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.accessCurUserPosts()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            print(self.curUserPosts)
            super.viewDidLoad()
            self.collection.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collection.reloadData()
    }
    @IBOutlet weak var collection: UICollectionView!
    
    @IBAction func addPost(_ sender: Any) {
        performSegue(withIdentifier: "addPost", sender: self)
    }
    
    func accessCurUserPosts() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        var user = Auth.auth().currentUser;
        let postRef = ref.child("Users/\(UserDefaults.standard.string(forKey: "ID")!)/myPosts")
//        var curUserPosts: [Post] = []
        let refHandle = postRef.observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            for (key, val) in postDict {
                print(key, val)
                let post = Post(title: val["title"] as! String, text: val["text"] as! String)
                post.date = formatter.date(from: val["date"] as! String)!
                self.curUserPosts.append(post)
            }
        })
        print("done with firebase retrieval")
//        return curUserPosts
    }
    
    
}
