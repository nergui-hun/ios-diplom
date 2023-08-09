//
//  Post.swift
//  Diplom
//
//  Created by M M on 7/29/23.
//

import Foundation

public struct Post {
    public let id: UInt
    public let userImage: String
    public let userName: String
    public let userJob: String
    public var postText: String
    public let postImage: String
    public var likes: UInt
    public let comments: UInt

    public init(id: UInt, userImage: String, userName: String, userJob: String, postText: String, postImage: String, likes: UInt, comments: UInt) {
        self.id = id
        self.userImage = userImage
        self.userName = userName
        self.userJob = userJob
        self.postText = postText
        self.postImage = postImage
        self.likes = likes
        self.comments = comments
    }
}
