//
//  Post.swift
//  stackz
//
//  Created by James Jung on 4/22/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class Post {
    var title: String!
    var text: String!
    var comments: [String]
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
        self.comments = []
    }
    
    func addComment(comment: String?) {
        guard let comm = comment else {
            print("invalid comment")
            return
        }
        comments.append(comm)
    }
    
}
