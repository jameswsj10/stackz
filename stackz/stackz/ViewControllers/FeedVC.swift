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

class FeedVC: UIViewController {
    @IBOutlet weak var cardView: KolodaView!
    var post_stacks: [postView] = []
    var post_array: [Post] = []
    
    @IBAction func savePost(_ sender: Any) {
        Firebase.addCurUserSaved(post: post_array[cardView.currentCardIndex])
        util.displayAlert(title: "Post Saved!", message: "Check your Saved to view", vc: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.delegate = self
        cardView.dataSource = self
        for feed in demoFeed {
            post_stacks.append(postView(frame: CGRect(x: 0, y: 0, width: 300, height: 500), title: feed.title, text: feed.text))
        }
        print(post_stacks)
        cardView.reloadData()
        
    }
    

}
