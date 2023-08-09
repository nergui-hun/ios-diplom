//
//  HomeViewModel.swift
//  Diplom
//
//  Created by M M on 7/29/23.
//

import Foundation
import UIKit

protocol HomeVMProtocol {
    func numberOfRows() throws -> Int
    func cellVM(forIndexPath indexPath: IndexPath) -> HomeTableVM
    var posts: [Post] { get set }
}

final class HomeVM: HomeVMProtocol {
    func numberOfRows() throws -> Int {
        if posts.count != 0 {
            return posts.count
        } else {
            print(posts.count)
            return 2
        }
    }

    func cellVM(forIndexPath indexPath: IndexPath) -> HomeTableVM {
        let post = posts[indexPath.row]
        return HomeTableVM(post: post)
    }

    var posts: [Post] = [Post(id: 1, userImage: "image1", userName: "Виктор Терещенко", userJob: "Дизайнер",
                             postText: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
                             postImage: "image2", likes: 40, comments: 40),
                         Post(id: 2, userImage: "image3", userName: "Иван Борисов", userJob: "iOS Developer", postText: "Summer, finally", postImage: "image4", likes: 50, comments: 50)
    ]
}
