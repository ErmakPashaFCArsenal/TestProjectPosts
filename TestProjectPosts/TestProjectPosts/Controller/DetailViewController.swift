//
//  DetailViewController.swift
//  TestProjectPosts
//
//  Created by macbook on 27.07.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var postTextDescription: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var postModel:PostModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
