//
//  HomeTableVM.swift
//  Diplom
//
//  Created by M M on 7/29/23.
//

import Foundation

struct HomeTableVM {

    var post: Post

    var postID: UInt {
        post.id
    }

    var userImage: String {
        post.userImage
    }

    var userName: String {
        post.userName
    }

    var userJob: String {
        post.userJob
    }

    var postText: String {
        post.postText
    }

    var postImage: String {
        post.postImage
    }

    var likes: UInt {
        post.likes
    }

    var comments: UInt {
        post.comments
    }
}
