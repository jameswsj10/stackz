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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.delegate = self as? KolodaViewDelegate
        cardView.dataSource = self as? KolodaViewDataSource
        // Do any additional setup after loading the view.
    }

    

}
