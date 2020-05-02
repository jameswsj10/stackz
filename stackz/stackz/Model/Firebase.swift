//
//  Firebase.swift
//  stackz
//
//  Created by James Jung on 4/23/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit
import Firebase

var ref: DatabaseReference!


class Firebase {
    static var ref = Database.database().reference()

    static func addPostToDB(post: Post) {
        var user = Auth.auth().currentUser;
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let postID = self.ref.child("posts").childByAutoId().key
        self.ref.child("posts").child(postID!).updateChildValues([
                    "title" : post.title!,
                    "text" : post.text!,
                    "date" : formatter.string(from: post.date),
                    "comments" : post.comments])
        // add post to current user's my post children
        self.ref.child("Users/\(user!.uid)/myPosts").updateChildValues([
            "title" : post.title!,
            "text" : post.text!,
            "date" : formatter.string(from: post.date),
            "comments" : post.comments])
            
    }
    
    static func accessCurUserPosts() -> [Post] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        var user = Auth.auth().currentUser;
        let postRef = ref.child("Users/\(user!.uid)/myPosts")
        var curUserPosts: [Post] = []
        let refHandle = postRef.observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            for (key, val) in postDict {
                let post = Post(title: val["title"] as! String, text: val["text"] as! String)
                post.date = formatter.date(from: val["date"] as! String)!
                curUserPosts.append(post)
            }
        })
        return curUserPosts
    }
    
    static func accessCurUserSaved() -> [Post] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        var user = Auth.auth().currentUser;
        let postRef = ref.child("Users/\(user!.uid)/saved")
        var curUserPosts: [Post] = []
        let refHandle = postRef.observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            for (key, val) in postDict {
                let post = Post(title: val["title"] as! String, text: val["text"] as! String)
                post.date = formatter.date(from: val["date"] as! String)!
                curUserPosts.append(post)
            }
        })
        return curUserPosts
    }

    
    static func accessPostsInDB() -> [Post] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let postRef = ref.child("posts")
        var allPosts: [Post] = []
        let refHandle = postRef.observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            for (key, val) in postDict {
                let post = Post(title: val["title"] as! String, text: val["text"] as! String)
                post.date = formatter.date(from: val["date"] as! String)!
                allPosts.append(post)
            }
        })
        return allPosts
    }
    
}

