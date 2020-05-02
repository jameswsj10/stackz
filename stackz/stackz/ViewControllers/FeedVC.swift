//
//  FeedVC.swift
//  stackz
//
//  Created by James Jung on 4/2/20.
//  Copyright © 2020 James Jung. All rights reserved.
//
import UIKit
import Foundation
import Koloda
import Firebase

class FeedVC: UIViewController {
    @IBOutlet weak var cardView: KolodaView!
    var post_stacks: [postView] = []
    var post_array: [Post] = []
    var ref = Database.database().reference()
    
    @IBAction func savePost(_ sender: Any) {
        Firebase.addCurUserSaved(post: post_array[cardView.currentCardIndex])
        util.displayAlert(title: "Post Saved!", message: "Check your Saved to view", vc: self)
    }
    override func viewDidLoad() {
        post_array = accessPostsInDB()
        cardView.delegate = self
        cardView.dataSource = self
//        for feed in post_array {
//            post_stacks.append(postView(frame: CGRect(x: 0, y: 0, width: 300, height: 500), title: feed.title, text: feed.text))
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            super.viewDidLoad()
            //print(self.post_array)
            //print(self.post_stacks)
            self.cardView.reloadData()
        }
    }
    
    func accessPostsInDB() -> [Post] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        let postRef = ref.child("posts")
        var allPosts: [Post] = []
        let refHandle = postRef.observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            for (key, val) in postDict {
                //print(key, val)
                let post = Post(title: val["title"] as! String, text: val["text"] as! String)
                post.date = formatter.date(from: val["date"] as! String)!
                self.post_array.append(post)
                self.post_stacks.append(postView(frame: CGRect(x: 0, y: 0, width: 300, height: 500), title: post.title, text: post.text))
            }
        })
        self.cardView.reloadData()
        return allPosts
    }

}
