//
//  PostCollectionViewCell.swift
//  TestProjectPosts
//
//  Created by macbook on 25.07.2022.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var postTextDescription: UILabel!
    @IBOutlet weak var dataText: UILabel!
    @IBOutlet weak var pushButton: UIButton!
    
    
    func setupCell(postsModel: PostCellData) {
        self.postLabel.text = postsModel.title
        self.postTextDescription.text = postsModel.preview_text
        self.likeLabel.text = String(postsModel.likes_count)
        self.pushButton.layer.cornerRadius = 10.0
    }
    
}
