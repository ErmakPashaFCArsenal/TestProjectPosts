//
//  DetailViewController.swift
//  TestProjectPosts
//
//  Created by macbook on 27.07.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var postModel: PostModel?
    
    @IBOutlet weak var postTextDescription: UILabel!{
        didSet {
            postTextDescription.text = postModel?.text
        }
    }
    @IBOutlet weak var imageView: UIImageView!{
        didSet {
            guard let image = postModel?.postImage else { return }
            imageView.image = UIImage(named: image)
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
