//
//  Util.swift
//  stackz
//
//  Created by James Jung on 4/29/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class util {
    static func displayAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Okay", style: .default, handler: { action in
        })
        alert.addAction(defaultAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func displayAlertDismiss(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Okay", style: .default, handler: { action in
            // dismissing the alert and view to main screen if pressed ok
            vc.dismiss(animated: true, completion: nil)
        })
        alert.addAction(defaultAction)
        vc.present(alert, animated: true, completion: nil)
    }
}
