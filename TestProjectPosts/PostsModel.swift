//
//  PostsModel.swift
//  TestProjectPosts
//
//  Created by macbook on 25.07.2022.
//

import Foundation

struct PostsModel: Decodable {
    var posts:[PostCellData]
}

struct PostCellData: Decodable {
    let postId: Int
    let timeshamp: Int
    let title: String
    let preview_text: String
    let likes_count: Int
}


