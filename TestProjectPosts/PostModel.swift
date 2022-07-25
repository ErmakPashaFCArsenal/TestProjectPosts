//
//  PostModel.swift
//  TestProjectPosts
//
//  Created by macbook on 25.07.2022.
//

import Foundation

struct Post: Decodable {
    let postId: Int
    let timeshamp: Int
    let title: String
    let text: String
    let postImage: String
    let likes_count: Int
}
