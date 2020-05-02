//
//  MyPostsVC.swift
//  stackz
//
//  Created by James Jung on 4/22/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class MyPostsVC: UIViewController {
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var searchBar: UISearchBar!
    var curUserPosts : [Post]?
    
    var postToDisplay : Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        curUserPosts = Firebase.accessCurUserPosts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collection.reloadData()
    }
    @IBOutlet weak var collection: UICollectionView!
    
    @IBAction func addPost(_ sender: Any) {
        performSegue(withIdentifier: "addPost", sender: self)
    }
    
    
}
