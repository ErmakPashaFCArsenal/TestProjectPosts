//
//  ViewController.swift
//  TestProjectPosts
//
//  Created by macbook on 25.07.2022.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemPostsArray: [PostsModel] = {
        var itemPost = [PostsModel]()
        itemPost.posts.postId = Int
        return [itemPost]
        
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let urlStringPosts = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
        
        guard let url = URL(string: urlStringPosts) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
//            let jsonString = String(data: data, encoding: .utf8)
//            if let jsonString = jsonString {
//            print(jsonString)
//            }
            do{
                let result = try JSONDecoder().decode(PostsModel.self, from: data)
                print(result.posts.first?.postId ?? "")
            }catch{
               print(error)
            }
        }.resume()
        
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        <#code#>
    }
}

