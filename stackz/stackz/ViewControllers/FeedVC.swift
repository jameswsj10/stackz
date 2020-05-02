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

class FeedVC: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var cardView: KolodaView!
    var post_stacks: [postView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.delegate = self
        cardView.dataSource = self
        for feed in demoFeed {
            post_stacks.append(postView(frame: CGRect(x: 0, y: 0, width: 300, height: 500), title: feed.title, text: feed.text))
        }
        print(post_stacks)
        cardView.reloadData()
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: "handleLongPress:")
         lpgr.minimumPressDuration = 0.5
         lpgr.delaysTouchesBegan = true
         lpgr.delegate = self
         self.view.addGestureRecognizer(lpgr)
    }
    
    func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            return
        }
        let alertController = UIAlertController(title: "Save this post?", message:
           "save this post to your collection, or cancel to continue", preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "Save", style: .default,handler: nil))
            alertController.addAction(UIAlertAction(title: "Cancel", style: .default,handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    

}
