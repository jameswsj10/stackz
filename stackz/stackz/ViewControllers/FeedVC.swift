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

var currentFeed: [Post]!

class FeedVC: UIViewController {
    @IBOutlet weak var cardView: KolodaView!
    var post_stacks: [postView] = []
    
    override func viewDidLoad() {
        cardView.delegate = self
        cardView.dataSource = self
        var postArr: [Post] = Firebase.accessPostsInDB()
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            super.viewDidLoad()
            for feed in postArr {
                self.post_stacks.append(postView(frame: CGRect(x: 0, y: 0, width: 300, height: 500), title: feed.title, text: feed.text))
            }
            print(self.post_stacks)
            self.cardView.reloadData()
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        var postArr: [Post] = Firebase.accessPostsInDB()
//        for feed in postArr {
//            post_stacks.append(postView(frame: CGRect(x: 0, y: 0, width: 300, height: 500), title: feed.title, text: feed.text))
//        }
//        print(post_stacks)
//        cardView.reloadData()
//    }

    

}
