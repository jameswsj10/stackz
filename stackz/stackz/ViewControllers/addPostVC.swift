//
//  addPostVC.swift
//  stackz
//
//  Created by James Jung on 4/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class addPostVC: UIViewController {
    var chosenPost: Post!
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createPost(_ sender: Any) {
        let title = titleText.text!
        let textContent = text.text!
        chosenPost = Post(title: title, text: textContent)
        demoFeed.append(chosenPost)
        
        let alert = UIAlertController(title: "Nice!", message: "Go back to My Posts to see your new post.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        viewDidAppear(false)
        self.dismiss(animated: true, completion: nil)
    }
    
}

