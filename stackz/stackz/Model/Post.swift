//
//  Post.swift
//  stackz
//
//  Created by James Jung on 4/22/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

// Create global instance of the feed for testing
var demoFeed = DemoPosts()

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

func DemoPosts() -> [Post] {
    let posts: [Post] = [
        Post(title: "title1", text: "text1"),
        Post(title: "t2", text: "text2"),
        Post(title: "dfsad", text: "asdfasdf")
    ]
    return posts
}

