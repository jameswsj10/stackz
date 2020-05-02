//
//  PostDetailVC.swift
//  stackz
//
//  Created by James Jung on 4/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class PostDetailVC: UIViewController {
    var recievedPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayText.text = recievedPost?.text
        displayTitle.text = recievedPost?.title
    }
    
    

    @IBOutlet weak var displayTitle: UILabel!
    
    @IBOutlet weak var displayText: UILabel!

    
}
