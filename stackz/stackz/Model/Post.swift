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
    var date: Date
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
        self.comments = []
        self.date = Date()
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
        Post(title: "title1", text: "text1 asdfasdfa asdfk asdfj as sdfj askdf jsdfj as fjas lkfaj ldkj ;aslf jasld jasl;kj fal;skjf lskadj flasdkjf ;salfj slak jlas;k jfas;lk jfls;adk jaslk jalsk fja;sldk ja;slkf sa;l ka;f js;alkfj a;slk fjsl;k fja; laksjf laksj "),
        Post(title: "t2", text: "text2"),
        Post(title: "dfsad", text: "asdfasdf")
    ]
    return posts
}
