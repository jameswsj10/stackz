//
//  LayoutManager.swift
//  stackz
//
//  Created by James Jung on 4/24/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class LayoutManager {
    static var toggleState: Int = 0
    
    
    static func toggleView(currState: Int) {
        toggleState = currState
    }
    
    static func updateLayout() -> CGSize {
        switch toggleState {
        case 0:
            return CGSize(width: 290, height: 140)
        case 1:
            return CGSize(width: 140, height: 140)
        default:
            return CGSize(width: 290, height: 290)
        }
    }
}
