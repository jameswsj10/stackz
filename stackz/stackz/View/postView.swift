//
//  postView.swift
//  stackz
//
//  Created by James Jung on 5/1/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

// a uiview for posts to display on the stacks
import Foundation
import UIKit
import Koloda

class postView: UIView {
//    var title: String
//    var text: String
    
    init(frame: CGRect, title: String, text: String) {
        super.init(frame: frame)
//        self.title = title
//        self.text = text
        setupView(title: title, text: text)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(title: String, text: String) {
        let headerTitle: UILabel = {
          let headerTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
          headerTitle.font = UIFont.systemFont(ofSize: 22, weight: .medium)
            headerTitle.text = title
          headerTitle.textAlignment = .center
          return headerTitle
        }()
        
        let bodyText: UILabel = {
            let bodyText = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
            bodyText.font = UIFont.systemFont(ofSize: 15, weight: .light)
            bodyText.text = text
            bodyText.textAlignment = .center
            return bodyText
        }()
        
        addSubview(headerTitle)
        addSubview(bodyText)
    }
}
