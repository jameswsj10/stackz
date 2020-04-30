//
//  addPostVC.swift
//  stackz
//
//  Created by James Jung on 4/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class addPostVC: UIViewController, UITextViewDelegate {
    var chosenPost: Post!
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.delegate = self
        text.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Insert Text Here ..."
            textView.textColor = UIColor.lightGray
        }
    }
    
    @IBAction func createPost(_ sender: Any) {
        let title = titleText.text!
        let textContent = text.text!
        chosenPost = Post(title: title, text: textContent)
        demoFeed.append(chosenPost)
        
        util.displayAlertDismiss(title: "Nice!", message: "Posted Successfully", vc: self)
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        viewDidAppear(false)
        self.dismiss(animated: true, completion: nil)
    }
    
}

